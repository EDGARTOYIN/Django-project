from django.apps import AppConfig


class ToolpocketAppConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'toolpocket_app'

    def ready(self):
        import toolpocket_app.signals # noqa