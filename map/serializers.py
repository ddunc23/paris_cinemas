from rest_framework import routers, serializers, viewsets
from rest_framework_gis.serializers import GeoFeatureModelSerializer
from map.models import Cinema, Letter

class CinemaSerializer(GeoFeatureModelSerializer):
    themes = serializers.StringRelatedField(many=True)
    class Meta:
        model = Cinema
        geo_field = 'geom'
        fields = ('id', 'name', 'themes')

class LetterSerializer(GeoFeatureModelSerializer):
	class Meta:
		model = Letter
		geo_field = 'geom'
		fields = ('id', 'name')