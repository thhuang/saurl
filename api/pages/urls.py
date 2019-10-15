from django.urls import path
from .views import (
    sww_view,
    route_view,
)

app_name = 'pages'
urlpatterns = [
    path('', sww_view, name='sww'),
    path('<str:code>/', route_view, name='route'),
]
