from django.urls import include, path

urlpatterns = [
    path('shorturls/', include('shorturls.urls')),
    path('', include('pages.urls')),
]
