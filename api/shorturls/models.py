from django.db import models


class ShortUrl(models.Model):
    user_id = models.CharField(max_length=40)
    url_code = models.CharField(max_length=20)
    long_url = models.TextField()
    short_url = models.CharField(max_length=40)
    created = models.DateTimeField()
    has_password = models.BooleanField(default=False)