# Generated by Django 4.1.7 on 2023-05-19 16:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('toolpocket_app', '0004_profile_favorite_products'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='pros_and_cons',
            field=models.TextField(blank=True, null=True),
        ),
    ]
