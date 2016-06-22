from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect, Http404
from map.models import Cinema
from map.serializers import CinemaSerializer
from rest_framework.renderers import JSONRenderer

# Create your views here.


def map(request):
	cinemas = Cinema.objects.all()

	return render(request, 'map/index.html', {'cinemas': cinemas})


# API views

class JSONResponse(HttpResponse):
    """An HttpResponse that its content into JSON."""
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

def cinemas(request):
	"""All Features as geoJson"""
	if request.method == 'GET':
		features =  Cinema.objects.all()
		serializer = CinemaSerializer(features, many=True)
		return JSONResponse(serializer.data)