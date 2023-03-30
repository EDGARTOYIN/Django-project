from django.shortcuts import render, redirect
from .models import Category,Product
from django.contrib import messages


# Create your views here.
def home(request):
    return render(request, "toolpocket_app/index.html")


def collections(request):
    category = Category.objects.filter(status=0)
    context = {'category': category}
    return render(request, "toolpocket_app/collections.html", context)


def collectionsview(request, slug):
    if Category.objects.filter(slug=slug, status=0):
        products = Product.objects.filter(category__slug=slug)
        category_name = Category.objects.filter(slug=slug).first()
        context = {'products': products, 'category_name': category_name}
        return render(request, "toolpocket_app/products/index.html", context)
    else:
        messages.warning(request, 'no such category found')
        return redirect('collections')
