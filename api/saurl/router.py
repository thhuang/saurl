from rest_framework import routers
from shorturls.views import ShortUrlsViewSet

router = routers.DefaultRouter()
router.register('shorturls', ShortUrlsViewSet, base_name='shorturl')