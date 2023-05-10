from django.shortcuts import render, redirect
from .models import Category, Product, Profile
from django.contrib import messages
from .forms import UserUpdateForm, ProfileUpdateForm
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.urls import reverse
from django.http import JsonResponse


# Create your views here.
def home(request):
    """
      Vista para la página de inicio.

      Filtra categorías y productos con estado '0' y crea un contexto para renderizar la plantilla
      'toolpocket_app/index.html' con las categorías y productos obtenidos.

      Args:
          request (HttpRequest): El objeto de solicitud HTTP.

      Returns:
          HttpResponse: El objeto de respuesta HTTP que renderiza la página de inicio.
      """
    category = Category.objects.filter(status=0)
    products = Product.objects.filter(status=0)
    context = {'category': category, 'products': products}
    return render(request, "toolpocket_app/index.html", context)


def search_products(request):
    query = request.GET.get('search_text')
    if query:
        products = Product.objects.filter(name__istartswith=query, status=0)
        data = [{'name': p.name, 'slug': p.slug, 'category_slug': p.category.slug, 'category_name': p.category.name, 'image': p.product_image.url if p.product_image else None} for p in products]

        if not products:
            return JsonResponse({'message': 'No se encontraron resultados.'})
        return JsonResponse({'data': data})
    return JsonResponse({'message': 'Ingresa una búsqueda válida.'})




def collections(request):
    """
     Vista para la página de colecciones.

     Filtra categorías con estado '0' y crea un contexto para renderizar la plantilla
     'toolpocket_app/collections.html' con las categorías obtenidas.

    Returns:
    HttpResponse: El objeto de respuesta HTTP que renderiza la página de vista de colecciones.
     """
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
        if Product.objects.filter(slug=prod_slug.strip(), status=0):
            products = Product.objects.filter(slug=prod_slug.strip(), status=0).first()
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
    """
      Vista para agregar un producto a favoritos.

      Verifica si el usuario está autenticado y si la solicitud es de tipo POST. Obtiene el ID del
      producto de la solicitud POST y busca el producto correspondiente en la base de datos. Obtiene
      el perfil de usuario asociado al usuario autenticado y agrega el producto a la lista de
      productos favoritos del perfil. Muestra un mensaje de éxito y redirige a la página de inicio.

      Returns:
          HttpResponse: El objeto de respuesta HTTP que redirige a la página de inicio.
      """
    if request.method == 'POST':
        product_id = request.POST.get('product_id')
        product = Product.objects.get(pk=product_id)
        user_profile = request.user.profile
        user_profile.favorite_products.add(product)
        messages.success(request, f'{product.name} agregado a tus favoritos')
    return redirect('/')
