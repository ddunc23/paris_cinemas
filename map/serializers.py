from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.models import Cinema

class CinemaSerializer(GeoFeatureModelSerializer):
    # categories = serializers.StringRelatedField(many=True)
    class Meta:
        model = Cinema
        geo_field = 'geom'
        fields = ('id', 'cinema')