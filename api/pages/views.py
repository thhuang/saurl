from django.shortcuts import get_object_or_404, redirect
from shorturls.models import ShortUrl


# TODO: Build the langing page
def home_view(request):
    """
    Landing Page
    """
    from django.http import HttpResponse
    return HttpResponse("<h1>Super Awesome URL</h1>")


def route_view(request, code):
    """
    Redirect to the original URL
    """
    instance = get_object_or_404(ShortUrl, url_code=code)
    return redirect(instance.long_url)
