# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('map', '0002_auto_20160620_1545'),
    ]

    operations = [
        migrations.RenameField(
            model_name='cinema',
            old_name='cinema',
            new_name='name',
        ),
    ]
