# Generated by Django 2.2.20 on 2021-05-22 10:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0002_auto_20210522_1050'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notifications',
            name='link_to_video',
            field=models.CharField(default=None, max_length=255, null=True),
        ),
    ]
