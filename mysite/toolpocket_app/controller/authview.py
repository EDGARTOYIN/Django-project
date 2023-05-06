from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout

from ..forms import CustomUserForm


def register(request):
    """
        Vista de registro de usuario.

        Esta vista maneja el registro de nuevos usuarios. Muestra un formulario de registro
        (instanciado a partir de CustomUserForm), y si se realiza una solicitud POST con datos válidos,
        guarda el nuevo usuario en la base de datos y redirige a la página de inicio de sesión.

        """
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
    """
        Vista de inicio de sesión.

        Esta vista maneja el inicio de sesión de los usuarios. Si el usuario ya ha iniciado sesión,
        se muestra un mensaje de advertencia y se redirige a la página principal. Si se realiza una solicitud POST con
        nombre de usuario y contraseña válidos, se realiza la autenticación del usuario y se inicia sesión en caso de éxito.
        En caso contrario, se muestra un mensaje de error y se redirige a la página de inicio de sesión.

        """
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
    """
        Vista de cierre de sesión.

        Esta vista maneja el cierre de sesión de los usuarios. Si el usuario ha iniciado sesión,
        se cierra su sesión y se muestra un mensaje de éxito. Luego, se redirige a la página principal.

        """
    if request.user.is_authenticated:
        logout(request)
        messages.success(request, 'sesion cerrada exitosamente')
    return redirect('/')

