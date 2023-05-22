from django.db import models
from django.contrib.auth.models import User
import datetime
import os
from PIL import Image
from django.urls import reverse


def get_file_path(request, filename):
    original_filename = filename
    nowTime = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (nowTime, original_filename)
    return os.path.join('uploads/', filename)


def get_file_path1(request, filename):
    original_filename = filename
    nowTime = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (nowTime, original_filename)
    return os.path.join('user_uploads/', filename)


class Category(models.Model):
    """
        Modelo para representar una categoría de productos en la base de datos.

        Attributes:
            slug (str): El slug de la categoría.
            name (str): El nombre de la categoría.
            image (ImageField): Una imagen asociada a la categoría.
            description (str): La descripción de la categoría.
            small_description (str): Una descripción breve de la categoría.
            status (bool): El estado de la categoría (0=default, 1=Hidden).
            trending (bool): Indica si la categoría está en tendencia (0=default, 1=Trending).
            meta_title (str): El título meta de la categoría.
            meta_keywords (str): Las palabras clave meta de la categoría.
            meta_description (str): La descripción meta de la categoría.
            created_at (DateTimeField): La fecha y hora de creación de la categoría.
            objects (Manager): El administrador de objetos del modelo.

        Methods:
            __str__(): Retorna el nombre de la categoría como representación en cadena del objeto.

        """
    slug = models.CharField(max_length=150, null=False, blank=False)
    name = models.CharField(max_length=150, null=False, blank=False)
    image = models.ImageField(upload_to=get_file_path, null=True, blank=True)
    description = models.TextField(max_length=500, null=False, blank=False)
    small_description = models.CharField(max_length=250, null=False, blank=False)
    status = models.BooleanField(default=False, help_text='0=default, 1=Hidden')
    trending = models.BooleanField(default=False, help_text='0=default, 1=Trending')
    meta_title = models.CharField(max_length=150, null=False, blank=False)
    meta_keywords = models.CharField(max_length=150, null=False, blank=False)
    meta_description = models.TextField(max_length=500, null=False, blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    objects = models.Manager()

    def __str__(self):
        return self.name


class Product(models.Model):

    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    slug = models.CharField(max_length=150, null=False, blank=False)
    name = models.CharField(max_length=150, null=False, blank=False)
    link = models.CharField(max_length=150, null=True, blank=False)
    product_image = models.ImageField(upload_to=get_file_path, null=True, blank=True)
    description = models.TextField(null=False, blank=False)
    status = models.BooleanField(default=False, help_text='0=default, 1=Hidden')
    trending = models.BooleanField(default=False, help_text='0=default, 1=Trending')
    tag = models.CharField(max_length=150, null=False, blank=False)
    meta_title = models.CharField(max_length=150, null=False, blank=False)
    meta_keywords = models.CharField(max_length=150, null=False, blank=False)
    meta_description = models.TextField(max_length=500, null=False, blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    pros_and_cons = models.TextField(blank=True, null=True)
    related_videos = models.TextField(blank=True, null=True)
    gif = models.TextField(blank=True, null=True)
    objects = models.Manager()

    def get_formatted_pros_and_cons(self):
        pros_and_cons = self.pros_and_cons.strip().split('\n')

        formatted_pros_and_cons = []

        for line in pros_and_cons:
            if line.startswith('- Puntos positivos:'):
                formatted_pros_and_cons.append(
                    '<span class="positive-point"><i class="fa-solid fa-circle-plus"></i>' + line[19:] + 'puntos positivos:' + '</span>')
            elif line.startswith('- Puntos negativos:'):
                formatted_pros_and_cons.append(
                    '<span class="negative-point"><i class="fa-solid fa-circle-minus"></i>' + line[19:] + 'puntos negativos:' + '</span>')
            elif line.strip() != '':
                formatted_pros_and_cons.append('<span class="bullet">&#8226;</span> ' + line)
            formatted_pros_and_cons.append('<br>')

        return ''.join(formatted_pros_and_cons)

    def __str__(self):
        return self.name


class Profile(models.Model):
    """
       Modelo para representar el perfil de usuario en la base de datos.

       Attributes:
           user (OneToOneField): El usuario al que está asociado el perfil.
           favorite_products (ManyToManyField): Los productos favoritos asociados al perfil.
           image (ImageField): Una imagen asociada al perfil.
           objects (Manager): El administrador de objetos del modelo.

       Methods:
           save(*args, **kwargs): Sobreescribe el método save() para procesar la imagen del perfil antes de guardarla.
           __str__(): Retorna una representación en cadena del objeto.

       """
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    favorite_products = models.ManyToManyField(Product)
    image = models.ImageField(default='user_uploads/default.jpg', upload_to=get_file_path1)
    objects = models.Manager()

    def save(self, *args, **kwargs):
        """
                Sobreescribe el método save() para procesar la imagen del perfil antes de guardarla.

                Este método se encarga de procesar la imagen del perfil antes de guardarla en la base de datos.
                Asegura que la imagen tenga un tamaño máximo de 300x300 píxeles antes de guardarla.

                Args:
                    *args: Argumentos posicionales pasados al método save().
                    **kwargs: Argumentos de palabras clave pasados al método save().

                """
        super().save(*args, **kwargs)

        img = Image.open(self.image.path)

        if img.height > 300 or img.width > 300:
            output_size = (300, 300)
            img.thumbnail(output_size)
            img.save(self.image.path)

    def __str__(self):
        return f'Perfil de {self.user.username}'
