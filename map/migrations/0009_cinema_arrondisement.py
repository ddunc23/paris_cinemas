# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0008_auto_20160729_1337'),
    ]

    operations = [
        migrations.AddField(
            model_name='cinema',
            name='arrondisement',
            field=models.CharField(max_length=128, null=True, blank=True),
        ),
    ]
