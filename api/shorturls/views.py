from os.path import join
from django.conf import settings
from django.http import HttpResponse, JsonResponse
from django.utils.timezone import now
from django.core.validators import URLValidator
from django.core.exceptions import ValidationError
from rest_framework import viewsets
from rest_framework.decorators import action
from rest_framework.parsers import JSONParser
from utils.generate_code import generate_code
from .models import ShortUrl
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from .serializers import ShortUrlSerializer


class ShortUrlsViewSet(viewsets.ViewSet):
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    def create(self, request):
        """
        Create a new short URL if it does not exist yet.
        """
        data = JSONParser().parse(request)
        user_id = data.get('user_id')
        long_url = data.get('long_url')

        # Verify URL
        try:
            validate = URLValidator(
                schemes=('http', 'https', 'ftp', 'ftps', 'rtsp', 'rtmp'))
            validate(long_url)
        except ValidationError:
            return JsonResponse({'message': 'Bad Request'}, status=400)

        # If the URL is shorten
        if ShortUrl.objects.filter(short_url=long_url).exists():
            serializer = ShortUrlSerializer(
                ShortUrl.objects.get(short_url=long_url))
            return JsonResponse(serializer.data, status=201)

        # If the shorten URL already exists
        if ShortUrl.objects.filter(long_url=long_url).exists():
            serializer = ShortUrlSerializer(
                ShortUrl.objects.get(long_url=long_url))
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
