from os.path import join
from django.conf import settings
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.timezone import now
from rest_framework.parsers import JSONParser
from utils.generate_code import generate_code
from .models import ShortUrl
from .serializers import ShortUrlSerializer


@csrf_exempt  # TODO: Just for testin! Remove csrf_exempt!
def shorturl_create_view(request):
    """
    Create a new short URL if it does not exist yet.
    """
    if request.method == 'POST':
        data = JSONParser().parse(request)
        user_id = data.get('user_id')
        long_url = data.get('long_url')

        # If the shorten URL already exists
        if ShortUrl.objects.filter(long_url=long_url).exists():
            serializer = ShortUrlSerializer(ShortUrl.objects.get(long_url=long_url))
            return JsonResponse(serializer.data, status=201) 

        # Generate a url code
        while (True):
            url_code = generate_code()
            if not ShortUrl.objects.filter(url_code=url_code).exists():
                break

        # Create a new instance
        serializer = ShortUrlSerializer(data={
            'user_id': user_id,
            'long_url': long_url,
            'url_code': url_code,
            'short_url': join(settings.BASE_URL, url_code),
            'created': now(),
        })

        # Save the instance
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)

        return JsonResponse(serializer.errors, status=400)

    # TODO: Just for testing. Remove GET method in the future.
    elif request.method == 'GET':
        shorturls = ShortUrl.objects.all()
        serializer = ShortUrlSerializer(shorturls, many=True)
        return JsonResponse(serializer.data, safe=False)