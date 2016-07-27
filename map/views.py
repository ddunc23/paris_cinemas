from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect, Http404
from map.models import Cinema, Letter, Theme
from map.serializers import CinemaSerializer, LetterSerializer
from rest_framework.renderers import JSONRenderer


def map(request):
	return render(request, 'map/index.html')


def cinema_page(request, cinema):
	cinema = get_object_or_404(Cinema, id=cinema)

	return render(request, 'map/cinema.html', {'cinema': cinema})


def letter_page(request, letter):
	letter = get_object_or_404(Letter, id=letter)

	return render(request, 'map/letter.html', {'letter': letter})


def all_cinemas(request):
	cinemas = Cinema.objects.all()

	return render(request, 'map/all_cinemas.html', {'cinemas': cinemas})


def all_letters(request):
	letters = Letter.objects.all()

	return render(request, 'map/all_letters.html', {'letters': letters})


def theme(request, theme):
	theme = get_object_or_404(Theme, id=theme)
	cinemas = Cinema.objects.filter(themes=theme)

	return render(request, 'map/theme.html', {'theme': theme, 'cinemas': cinemas})

# API views

class JSONResponse(HttpResponse):
    """An HttpResponse that its content into JSON."""
    def __init__(self, data, **kwargs):
        content = JSONRenderer().render(data)
        kwargs['content_type'] = 'application/json'
        super(JSONResponse, self).__init__(content, **kwargs)

def cinemas(request):
	"""All Cinemas as geoJson"""
	if request.method == 'GET':
		cinemas =  Cinema.objects.all()
		serializer = CinemaSerializer(cinemas, many=True)
		return JSONResponse(serializer.data)

def cinema(request, cinema):
	"""A single cinema"""
	if request.method == 'GET':
		cinema = Cinema.objects.get(id=cinema)
		serializer = CinemaSerializer(cinema, many=False)
		return JSONResponse(serializer.data)

def cinemas_by_theme(request, theme):
	"""All cinemas in a single theme"""
	if request.method == 'GET':
		cinemas = Cinema.objects.filter(themes=theme)
		serializer = CinemaSerializer(cinemas, many=True)
		return JSONResponse(serializer.data)


def letters(request):
	"""All letters as geoJson"""
	if request.method == 'GET':
		letters = Letter.objects.all()
		serializer = LetterSerializer(letters, many=True)
		return JSONResponse(serializer.data)