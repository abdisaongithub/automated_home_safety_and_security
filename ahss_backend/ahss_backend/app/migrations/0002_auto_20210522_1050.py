# Generated by Django 2.2.20 on 2021-05-22 10:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notifications',
            name='link_to_video',
            field=models.CharField(default=None, max_length=255),
        ),
    ]
