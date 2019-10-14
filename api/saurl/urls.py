from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path('shorturls/', include('shorturls.urls')),
    path('admin/', admin.site.urls),
    path('', include('pages.urls')),
]
