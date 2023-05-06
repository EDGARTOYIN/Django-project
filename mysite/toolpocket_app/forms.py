from django.contrib.auth.forms import UserCreationForm

from .models import User, Profile
from django import forms


class CustomUserForm(UserCreationForm):
    """
        Formulario personalizado de registro de usuario.

        Este formulario hereda de UserCreationForm de Django y personaliza la apariencia y validación
        de los campos de usuario, email y contraseña.

        Attributes:
            username (CharField): Campo de texto para el nombre de usuario.
            email (CharField): Campo de texto para el email del usuario.
            password1 (CharField): Campo de contraseña para la contraseña del usuario.
            password2 (CharField): Campo de contraseña para confirmar la contraseña del usuario.
            Meta (class): Clase Meta para configurar el modelo y los campos del formulario.

        """
    username = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control my-2', 'placeholder': 'Introduce usuario'}))
    email = forms.CharField(
        widget=forms.TextInput(attrs={'class': 'form-control my-2', 'placeholder': 'Introduce email'}))
    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control my-2', 'placeholder': 'Introduce password'}))
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={'class': 'form-control my-2', 'placeholder': 'confirma password'}))

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']


class UserUpdateForm(forms.ModelForm):
    """
        Formulario para actualizar la información de usuario.

        Este formulario permite a los usuarios actualizar su nombre de usuario y email.

        Attributes:
            Meta (class): Clase Meta para configurar el modelo y los campos del formulario.

        """
    class Meta:
        """
           Formulario para actualizar la imagen de perfil de usuario.

           Este formulario permite a los usuarios actualizar su imagen de perfil.

           Attributes:
               Meta (class): Clase Meta para configurar el modelo y los campos del formulario.

           """
        model = User
        fields = ['username', 'email']




class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image']

