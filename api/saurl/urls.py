from django.urls import include, path

urlpatterns = [
    path('api/shorturls/', include('shorturls.urls')),
    path('', include('pages.urls')),
]
