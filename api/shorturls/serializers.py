from rest_framework import serializers
from .models import ShortUrl


class ShortUrlSerializer(serializers.ModelSerializer):
    class Meta:
        model = ShortUrl
        fields = [
            'id',
            'user_id',
            'url_code',
            'long_url',
            'short_url',
            'created',
        ]
