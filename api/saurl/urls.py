from rest_framework.authtoken.views import obtain_auth_token
from django.urls import include, path
from .router import router

urlpatterns = [
    path('api/', include(router.urls), name='api'),
    path('api-token-auth/', obtain_auth_token, name='api-token-auth'),
    path('', include('pages.urls')),
]
