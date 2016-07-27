from map.models import Theme

def theme_links(request):
	themes = Theme.objects.all()
	return {'themes': themes}