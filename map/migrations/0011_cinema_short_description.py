# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0010_cinema_thumbnail'),
    ]

    operations = [
        migrations.AddField(
            model_name='cinema',
            name='short_description',
            field=models.CharField(max_length=140, null=True, blank=True),
        ),
    ]
