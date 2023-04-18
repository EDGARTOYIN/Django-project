from django.shortcuts import render, redirect
from .models import Category, Product, Profile, User
from django.contrib import messages
from .forms import UserUpdateForm, ProfileUpdateForm
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login, logout


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


@login_required
def profile(request):
    profile_user = Profile.objects.get(user=request.user)
    if request.method == 'POST':
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(request.POST, request.FILES, instance=request.user.profile)

        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, f'tu cuenta ha sido acutalizada')
            return redirect('profile')

    else:
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)

    context = {'profile_user': profile_user, 'u_form': u_form, 'p_form': p_form}
    return render(request, 'toolpocket_app/auth/profile.html', context)


@login_required
def add_to_favorites(request):
    if request.method == 'POST':
        product_id = request.POST.get('product_id')
        product = Product.objects.get(pk=product_id)
        user_profile = request.user.profile
        user_profile.favorite_products.add(product)
        messages.success(request, f'{product.name} agregado a tus favoritos')
    return redirect('/')

