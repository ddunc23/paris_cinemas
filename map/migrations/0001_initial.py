# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cinema',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('cinema', models.CharField(max_length=128, verbose_name=b'Cinema Name')),
                ('geom', django.contrib.gis.db.models.fields.PointField(srid=4326)),
                ('other_name', models.CharField(max_length=256, null=True, verbose_name=b'Other Name(s)', blank=True)),
                ('open_date', models.CharField(max_length=64, null=True, verbose_name=b'Opening Date', blank=True)),
                ('date', models.CharField(max_length=64, null=True, blank=True)),
                ('o_address', models.CharField(max_length=256, null=True, verbose_name=b'Original Address', blank=True)),
                ('c_address', models.CharField(max_length=256, null=True, verbose_name=b'Current Address', blank=True)),
                ('city', models.CharField(max_length=64, null=True, blank=True)),
                ('postcode', models.CharField(max_length=32, null=True, blank=True)),
                ('x', models.FloatField(null=True, blank=True)),
                ('y', models.FloatField(null=True, blank=True)),
                ('barrabas', models.CharField(max_length=256, null=True, verbose_name=b'Barrabas March 1920', blank=True)),
                ('les_deux', models.CharField(max_length=256, null=True, verbose_name=b'Les Deux Gamines 1921', blank=True)),
                ('meetings', models.CharField(max_length=256, null=True, verbose_name=b'Political meetings 1918-1924', blank=True)),
                ('crimes', models.CharField(max_length=256, null=True, blank=True)),
            ],
        ),
    ]
