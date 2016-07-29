# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import map.models


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0009_cinema_arrondisement'),
    ]

    operations = [
        migrations.AddField(
            model_name='cinema',
            name='thumbnail',
            field=models.ImageField(upload_to=map.models.feature_directory_path, null=True, verbose_name=b'Thumbnail Image', blank=True),
        ),
    ]
