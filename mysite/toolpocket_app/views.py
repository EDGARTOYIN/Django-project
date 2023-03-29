from django.shortcuts import render
from .models import *

# Create your views here.
def home(request):
    return render(request, "toolpocket_app/index.html")


def collections(request):
    category = Category.objects.filter(status=0)
    context = {'category': category}
    return render(request, "toolpocket_app/collections.html", context)

