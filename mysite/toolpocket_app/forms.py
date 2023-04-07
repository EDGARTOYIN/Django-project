from django.contrib.auth.forms import UserCreationForm

from .models import User, Profile
from django import forms

from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit


class CustomUserForm(UserCreationForm):
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
    class Meta:
        model = User
        fields = ['username', 'email']

    def __init__(self, *args, **kwargs):
        super(UserUpdateForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Update', css_class='btn float-end shadow btn-success px-4'))


class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['image']

    def __init__(self, *args, **kwargs):
        super(ProfileUpdateForm, self).__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_method = 'post'
        self.helper.add_input(Submit('submit', 'Update', css_class='btn float-end shadow btn-success px-4'))