# EzDates.py

### A new python class that provide a new data type for date & time handling:
    $ __init__(self)            - Initialize object with the current timestamp
    $ __str__(self, ts)         - Provide "str(ts)" and "print ts" functionality 
    $ __sub__(self, ts)         - Return "ts - self" (time difference in seconds)
    $ dateDiff(self, ts)        - Return "ts - self" (time difference in seconds) 
    $ updateTimestamp(ts)       - Update "ts" object with the current date and time
    $ convertToSeconds(self)    - Convert "self" object to seconds passed from 1970/01/01
    $ convertToEzDates(self,ts) - Convert string timestamp to EzDates object
