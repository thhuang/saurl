from django.urls import include, path
from .router import router

urlpatterns = [
    path('api/', include(router.urls), name='api'),
    path('', include('pages.urls')),
]
