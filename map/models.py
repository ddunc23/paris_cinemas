from django.db import models
from django.contrib.gis.db import models
from ckeditor_uploader.fields import RichTextUploadingField


def feature_directory_path(instance, filename):
	"""Function to ensure image files will be uploaded to /uploads/features/<feature.id>/filename"""
	try:
		feature = instance.cinema
		return 'uploads/cinemas/{0}/{1}'.format(feature.id, filename)
	except:
		return 'uploads/cinemas/{0}/{1}'.format(instance.id, filename)



class Theme(models.Model):
	title = models.CharField(max_length=140)
	slug = models.SlugField()
	body = RichTextUploadingField(blank=False)
	TYPE_CHOICES = (
		('FILM', 'Film'),
	)
	theme_type = models.CharField(max_length=24, choices=TYPE_CHOICES)

	def __unicode__(self):
		return self.title


class Cinema(models.Model):
	name = models.CharField(max_length=128, verbose_name='Cinema Name')
	geom = models.PointField()
	other_name = models.CharField(max_length=256, verbose_name='Other Name(s)', blank=True, null=True)
	open_date= models.CharField(max_length=256, verbose_name='Opening Date', blank=True, null=True)
	date = models.CharField(max_length=256, blank=True, null=True)
	o_address = models.CharField(max_length=256, verbose_name='Original Address', blank=True, null=True)
	c_address = models.CharField(max_length=256, verbose_name='Current Address', blank=True, null=True)
	city = models.CharField(max_length=256, blank=True, null=True)
	postcode = models.CharField(max_length=32, blank=True, null=True)
	x = models.FloatField(null=True, blank=True)
	y = models.FloatField(null=True, blank=True)
	# Take the films out - they're going to be themes
	barrabas = models.CharField(max_length=256, verbose_name='Barrabas March 1920', blank=True, null=True)
	les_deux = models.CharField(max_length=256, verbose_name='Les Deux Gamines 1921', blank=True, null=True)
	meetings = models.CharField(max_length=256, verbose_name='Political meetings 1918-1924', blank=True, null=True)
	crimes = models.CharField(max_length=256, blank=True, null=True)
	themes = models.ManyToManyField(Theme, blank=True)

	def get_themes(self):
		themes = ''
		for theme in self.themes.all():
			themes += theme.title
			themes += ', '
		return themes

	get_themes.short_description = 'Themes'
			

	def __unicode__(self):
		return self.name

# You need a 'themes' class - like categories in SolW, but with a page and gallery

# You also need images

# These aren't so much letters as fans - fans have a page with letters attached

class Letter(models.Model):
	letter_id = models.CharField(max_length=8, verbose_name='Letter Number', blank=True, null=True)
	geom = models.PointField()
	month = models.CharField(max_length=10, blank=True, null=True)
	year = models.CharField(max_length=4)
	date = models.CharField(max_length=10, blank=True, null=True)
	o_address = models.CharField(max_length=256, verbose_name='Original Address', blank=True, null=True)
	c_address = models.CharField(max_length=256, verbose_name='Current Address', blank=True, null=True)
	city = models.CharField(max_length=256, blank=True, null=True)
	postcode = models.CharField(max_length=32, blank=True, null=True)
	x = models.FloatField(null=True, blank=True)
	y = models.FloatField(null=True, blank=True)
	name = models.CharField(max_length=128)
	occupation = models.CharField(max_length=128, blank=True, null=True)
	SEX_CHOICES = (
		('MALE', 'Male'),
		('FEMALE', 'Female'),
	)
	sex = models.CharField(max_length=16, blank=True, null=True, choices=SEX_CHOICES)
	letter_pur = models.CharField(max_length=255, blank=True, null=True)
	contrib_no = models.CharField(max_length=16, blank=True, null=True)
	persons = models.CharField(max_length=255, blank=True, null=True)
	practices = models.CharField(max_length=255, blank=True, null=True)
	magazines = models.CharField(max_length=255, blank=True, null=True)
	cinema = models.CharField(max_length=255, blank=True, null=True)
	themes = models.ManyToManyField(Theme, blank=True)

	def __unicode__(self):
		return self.name


letter_mapping = {
    'letter_id' : 'letter_id',
    'month' : 'month',
    'year' : 'year',
    'date' : 'date',
    'o_address' : 'o_address',
    'c_address' : 'c_address',
    'city' : 'city',
    'postcode' : 'postcode',
    'x' : 'X',
    'y' : 'Y',
    'name' : 'name',
    'occupation' : 'occupation',
    'age' : 'age',
    'sex' : 'sex',
    'letter_pur' : 'letter_pur',
    'contrib_no' : 'contrib_no',
    'persons' : 'persons',
    'practices' : 'practices',
    'magazines' : 'magazines',
    'gifts' : 'gifts',
    'cinema' : 'cinema',
    'geom' : 'POINT',
}



cinema_mapping = {
    'cinema' : 'cinema',
    'other_name' : 'other_name',
    'open_date' : 'open_date',
    'date' : 'date',
    'o_address' : 'o_address',
    'c_address' : 'c_address',
    'city' : 'city',
    'postcode' : 'postcode',
    'x' : 'X',
    'y' : 'Y',
    'barrabas' : 'barrabas',
    'les_deux' : 'les_deux',
    'meetings' : 'meetings',
    'crimes' : 'crimes',
    'geom' : 'POINT',
}