from django.urls import path
from .views import (
    home_view,
    route_view,
)

app_name = 'pages'
urlpatterns = [
    path('', home_view, name='home'),
    path('<str:code>/', route_view, name='route'),
]
