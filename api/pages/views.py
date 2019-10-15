from django.shortcuts import get_object_or_404, redirect
from shorturls.models import ShortUrl


def sww_view(request):
    """
    Something Went Wrong Page
    """
    from django.http import HttpResponse
    return HttpResponse("<h1>Something Went Wrong...</h1>")


def route_view(request, code):
    """
    Redirect to the original URL
    """
    instance = get_object_or_404(ShortUrl, url_code=code)
    return redirect(instance.long_url, permanent=True)
