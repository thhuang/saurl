from django.urls import path
from shorturls.views import shorturl_create_view


app_name = 'shorturls'
urlpatterns = [
    path('', shorturl_create_view, name='shorturl-create'),
]
