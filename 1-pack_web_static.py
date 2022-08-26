#!/usr/bin/python3
"""pack web static"""


import fabric
import os
from datetime import datetime
dt = datetime.now()
ts = datetime.timestamp(dt)
date_time = datetime.fromtimestamp(ts)
str_good = date_time.strftime("%Y%m%d%H%M%S")


def do_pack():
    """ def do pack"""
    os.system('sudo tar -c "web_static_",str_good "/data/web_static/"')
