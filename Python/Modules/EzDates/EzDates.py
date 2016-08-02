#!/usr/bin/python
"""
   EzDates Ver 1.1   2014-04-24

   EzDates provide a new data type for date & time handling:
   * __init__(self)      - Initialize object with the current timestamp
   * __str__(self, ts)   - Provide "str(ts)" and "print ts" functionality
   * __sub__(self, ts)   - Return "ts - self" (time difference in seconds)
   * dateDiff(self, ts)  - Return "ts - self" (time difference in seconds)
   * updateTimestamp(ts) - Update "ts" object with the current date and time
   * convertToSeconds(self)    - Convert to seconds passed from 1970/01/01
   * convertToEzDates(self,ts) - Convert string timestamp to EzDates object

   Developer: ilan.shavit@gmail.com
"""
import datetime
import time

class EzDates(object):
    """
    Provide a new data type for date & time manipulation
    """
    def __init__(self):
        ts1 = datetime.datetime.now()
        self.year = str(ts1.year)
        if ts1.month < 10:
            self.month = "0" + str(ts1.month)
        else:
            self.month = str(ts1.month)

        if ts1.day < 10:
            self.day = "0" + str(ts1.day)
        else:
            self.day = str(ts1.day)

        if ts1.hour < 10:
            self.hour = "0" + str(ts1.hour)
        else:
            self.hour = str(ts1.hour)

        if ts1.minute < 10:
            self.minute = "0" + str(ts1.minute)
        else:
            self.minute = str(ts1.minute)

        if ts1.second < 10:
            self.second = "0" + str(ts1.second)
        else:
            self.second = str(ts1.second)

    def __str__(self):
    # Provide functionality for str(EzDates_Object) & print EzDates_Object
        return self.year + '-' + self.month + '-' + self.day + ' ' +\
               self.hour + ':' + self.minute + ':' + self.second

    def __sub__(self, ts1):
    # Return the difference between two dates (in seconds)
        return self.convert_to_seconds() - ts1.convert_to_seconds()

    def date_diff(self, ts1):
        """
        Return the difference between two dates (in seconds)

        """
        return self.convert_to_seconds() - ts1.convert_to_seconds()

    def update_timestamp(self):
        """
        Update EzDates object with current timestamp

        """
        ts1 = datetime.datetime.now()
        self.year = str(ts1.year)
        if ts1.month < 10:
            self.month = "0" + str(ts1.month)
        else:
            self.month = str(ts1.month)

        if ts1.day < 10:
            self.day = "0" + str(ts1.day)
        else:
            self.day = str(ts1.day)

        if ts1.hour < 10:
            self.hour = "0" + str(ts1.hour)
        else:
            self.hour = str(ts1.hour)

        if ts1.minute < 10:
            self.minute = "0" + str(ts1.minute)
        else:
            self.minute = str(ts1.minute)

        if ts1.second < 10:
            self.second = "0" + str(ts1.second)
        else:
            self.second = str(ts1.second)


    def convert_to_seconds(self):
        """
        Return seconds passed from 1970-01-01

        """
        ts1 = (int(self.year), int(self.month), int(self.day),
              int(self.hour), int(self.minute), int(self.second), 0, 0, 0)
        return time.mktime(ts1)


    def convert_to_ezdates(self, ts1):
        """
        Convert string timestamp to EzDates object

        """
        self.year = ts1[0:4]
        self.month = ts1[5:7]
        self.day = ts1[8:10]
        self.hour = ts1[11:13]
        self.minute = ts1[14:16]
        self.second = ts1[17:19]
