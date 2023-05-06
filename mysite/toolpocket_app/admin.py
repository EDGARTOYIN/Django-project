from django.contrib import admin
from .models import Category, Product, Profile

"""
Registrar tus modelos en el sitio de administración de Django.

Este código registra los modelos Category, Product y Profile en el sitio de administración
de Django para que puedan ser gestionados a través de la interfaz de administración. Los modelos
son registrados usando la función `admin.site.register()` proporcionada por Django, que agrega los modelos
a la lista de modelos administrables en el sitio de administración.
"""


admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Profile)
