# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.contrib.gis.db.models.fields


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0003_auto_20160623_1028'),
    ]

    operations = [
        migrations.CreateModel(
            name='Letter',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('letter_id', models.CharField(max_length=8, null=True, verbose_name=b'Letter Number', blank=True)),
                ('geom', django.contrib.gis.db.models.fields.PointField(srid=4326)),
                ('month', models.CharField(max_length=10, null=True, blank=True)),
                ('year', models.CharField(max_length=4)),
                ('date', models.CharField(max_length=10, null=True, blank=True)),
                ('o_address', models.CharField(max_length=256, null=True, verbose_name=b'Original Address', blank=True)),
                ('c_address', models.CharField(max_length=256, null=True, verbose_name=b'Current Address', blank=True)),
                ('city', models.CharField(max_length=256, null=True, blank=True)),
                ('postcode', models.CharField(max_length=32, null=True, blank=True)),
                ('x', models.FloatField(null=True, blank=True)),
                ('y', models.FloatField(null=True, blank=True)),
                ('name', models.CharField(max_length=128)),
                ('occupation', models.CharField(max_length=128, null=True, blank=True)),
                ('sex', models.CharField(blank=True, max_length=6, null=True, choices=[(b'MALE', b'Male'), (b'FEMALE', b'Female')])),
                ('letter_pur', models.CharField(max_length=255, null=True, blank=True)),
                ('contrib_no', models.CharField(max_length=16, null=True, blank=True)),
                ('persons', models.CharField(max_length=255, null=True, blank=True)),
                ('practices', models.CharField(max_length=255, null=True, blank=True)),
                ('magazines', models.CharField(max_length=255, null=True, blank=True)),
                ('cinema', models.CharField(max_length=255, null=True, blank=True)),
            ],
        ),
    ]
