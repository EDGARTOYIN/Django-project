# Generated by Django 4.1.7 on 2023-04-05 08:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import toolpocket_app.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('toolpocket_app', '0002_product_link'),
    ]

    operations = [
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(default='user_uploads/default.jpg', upload_to=toolpocket_app.models.get_file_path1)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
