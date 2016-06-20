from django.db import models
from django.contrib.gis.db import models

# Create your models here.

class Cinema(models.Model):
	cinema = models.CharField(max_length=128, verbose_name='Cinema Name')
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
	barrabas = models.CharField(max_length=256, verbose_name='Barrabas March 1920', blank=True, null=True)
	les_deux = models.CharField(max_length=256, verbose_name='Les Deux Gamines 1921', blank=True, null=True)
	meetings = models.CharField(max_length=256, verbose_name='Political meetings 1918-1924', blank=True, null=True)
	crimes = models.CharField(max_length=256, blank=True, null=True)

	def __unicode__(self):
		return self.cinema


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