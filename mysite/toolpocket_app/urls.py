from django.urls import path
from . import views

urlpatterns = [
    # primer valor identifica el nombre del url
    path('', views.home, name='home'),
    path('collections', views.collections, name='collections'),
    path('collections/<str:slug>', views.collectionsview, name="collectionsview")
]

