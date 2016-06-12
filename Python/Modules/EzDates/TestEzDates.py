#!/usr/bin/python
"""
   Test EzDates class
   Version: 1.1

   Developer: ilan.shavit@gmail.com
"""
from EzDates import EzDates
import time


def main():
    """
    Test several methods of EzDate

    """
    ts1 = EzDates()
    ts2 = EzDates()

    print "# ts1 = EzDates()\n", ts1, "\n"

    print "# str(EzDates.convert_to_seconds(ts1))"
    print str(EzDates.convert_to_seconds(ts1))

    time.sleep(3)
    print "\nAfter 3 seconds: EzDates.updateTimestamp(ts2) "
    EzDates.update_timestamp(ts2)
    print "ts2 =", ts2
    print "convert_to_seconds = " + str(EzDates.convert_to_seconds(ts2))

    print "\n# ts2.date_diff(ts1) \n", ts2.date_diff(ts1), "\n"


    print "ts3 = '2012-12-28 20:12:16'"
    ts3 = '2012-12-28 20:12:16'
    print ts3, "\n"

    ts4 = EzDates()
    print "EzDates.convert_to_ezdates(ts4, ts3)"
    EzDates.convert_to_ezdates(ts4, ts3)
    print ts4


if __name__ == "__main__":
    main()
