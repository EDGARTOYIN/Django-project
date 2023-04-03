from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout

from ..forms import CustomUserForm


def register(request):
    form = CustomUserForm()
    if request.method == 'POST':
        form = CustomUserForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Registro exitoso! puedes Inicia sesion")
            return redirect('/login')
    context = {'form': form}
    return render(request, "toolpocket_app/auth/register.html", context)


def loginpage(request):
    if request.user.is_authenticated:
        messages.warning(request, "tu sesion ya esta iniciada")
        return redirect('/')
    else:
        if request.method == 'POST':
            name = request.POST.get('username')
            passwd = request.POST.get('password')

            user = authenticate(request, username=name, password=passwd)

            if user is not None:
                login(request, user)
                messages.success(request, "Login exitoso")
                return redirect('/')
            else:
                messages.error(request, "Usuario o password invalidas")
                return redirect('/login')
    return render(request, "toolpocket_app/auth/login.html")


def logoutpage(request):
    if request.user.is_authenticated:
        logout(request)
        messages.success(request, 'sesion cerrada exitosamente')
    return redirect('/')

