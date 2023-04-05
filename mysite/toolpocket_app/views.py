from django.shortcuts import render, redirect
from .models import Category, Product, Profile
from django.contrib import messages


# Create your views here.
def home(request):
    category = Category.objects.filter(status=0)
    products = Product.objects.filter(status=0)
    context = {'category': category, 'products': products}
    return render(request, "toolpocket_app/index.html", context)


def collections(request):
    category = Category.objects.filter(status=0)
    context = {'category': category}
    return render(request, "toolpocket_app/collections.html", context)


def collectionsview(request, slug):
    if Category.objects.filter(slug=slug, status=0):
        products = Product.objects.filter(category__slug=slug)
        category = Category.objects.filter(slug=slug).first()
        context = {'products': products, 'category': category}
        return render(request, "toolpocket_app/products/index.html", context)
    else:
        messages.warning(request, 'no such category found')
        return redirect('collections')


def productview(request, cate_slug, prod_slug):
    if Category.objects.filter(slug=cate_slug, status=0):
        if Product.objects.filter(slug=prod_slug, status=0):
            products = Product.objects.filter(slug=prod_slug, status=0).first()
            context = {'products': products}
        else:
            messages.error(request, 'No se encontro ese producto')
            return redirect('collections')
    else:
        messages.error(request, 'No se encontro esa categoria')
        return redirect('collections')
    return render(request, "toolpocket_app/products/view.html", context)


def profile(request):
    user = Profile.objects.get(user=request.user)
    context = {'user': user}
    return render(request, 'toolpocket_app/auth/profile.html', context)
