from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User
from .models import Profile


@receiver(post_save, sender=User)
def crear_profile(sender, instance, created, **kwargs):
    """
     Crea automáticamente un perfil de usuario cuando se crea un nuevo objeto User en el modelo de base de datos.

     Args:
         sender (type): El modelo que envía la señal (en este caso, User).
         instance (User): La instancia del objeto User que se acaba de guardar.
         created (bool): Indica si el objeto User se acaba de crear o no.
         **kwargs: Otros argumentos pasados a la función (no utilizados en esta función).

     """
    if created and not instance.is_superuser:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    """
        Guarda automáticamente el perfil de usuario después de guardar un objeto User en el modelo de base de datos.

        Args:
            sender (type): El modelo que envía la señal (en este caso, User).
            instance (User): La instancia del objeto User que se acaba de guardar.
            **kwargs: Otros argumentos pasados a la función (no utilizados en esta función).
    """
    if not instance.is_superuser:
        instance.profile.save()
