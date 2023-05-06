from django.urls import path
from . import views
from .controller import authview

"""
    URL patterns para la aplicación web de ToolPocket.

    Estas URL patterns definen las rutas de URL para la aplicación web de ToolPocket. Cada ruta se vincula a una 
    función de vista correspondiente y se nombra para su fácil referencia. Las URL patterns son utilizadas por el 
    enrutador de Django para direccionar las solicitudes de los usuarios a las vistas apropiadas en la aplicación 
    web.
    
"""

urlpatterns = [
    # primer valor identifica el nombre del url
    path('', views.home, name='home'),
    path('collections', views.collections, name='collections'),
    path('search/', views.search_products, name='search_products'),
    path('collections/<str:slug>', views.collectionsview, name='collectionsview'),
    path('collections/<str:cate_slug>/<str:prod_slug>/', views.productview, name='productview'),
    path('register/', authview.register, name='register'),
    path('login/', authview.loginpage, name='loginpage'),
    path('logout/', authview.logoutpage, name='logout'),
    path('profile/', views.profile, name='profile'),
    path('add_to_favorites/', views.add_to_favorites, name='add_to_favorites'),
]

