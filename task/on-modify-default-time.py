#!/usr/bin/env python

import sys
import re
import json
from datetime import time, datetime
from dateutil import parser

DEFAULT_TIME = time(23,30,0)

def is_local_midnight(dt):
    return dt.astimezone().time() == time(0,0,0)

def set_default_time(timestamp):
    return timestamp.astimezone().replace(
        hour=DEFAULT_TIME.hour,
        minute=DEFAULT_TIME.minute,
        second=DEFAULT_TIME.second,
    ).isoformat()

def hook_default_time(task, due):
        task['due'] = set_default_time(due)
        print("Default due time has been set.")

original_task = json.loads(sys.stdin.readline())
task = json.loads(sys.stdin.readline())

if 'due' in task and task['due']:
    due = parser.parse(task["due"])
    if is_local_midnight(due):
        hook_default_time(task, due)

print(json.dumps(task))
sys.exit(0)
