from django.apps import AppConfig


class ToolpocketAppConfig(AppConfig):
    """
        Configuración de la aplicación 'toolpocket_app' en Django.

        Atributos:
            default_auto_field (str): Especifica el tipo de campo automático utilizado para campos de clave primaria en modelos.
                                     En este caso, se utiliza 'django.db.models.BigAutoField'.
            name (str): Especifica el nombre de la aplicación.
        """
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'toolpocket_app'

    def ready(self):
        """
              Método que se ejecuta cuando la aplicación está lista para su uso.

              Se encarga de importar el archivo de señales 'toolpocket_app.signals' para asegurarse de que las señales
              estén registradas y sean funcionales en la aplicación.
              """
        import toolpocket_app.signals # noqa