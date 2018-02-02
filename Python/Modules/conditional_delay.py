#!/usr/bin/env  python2
"""
    conditional_delay:
    sleep the program for a while if it's start running after system restart

    Ver: 1.0 Beta1 (2018-02-02)
    Developer: ilan.shavit@gmail.com

    Usage:
    from conditional_delay import conditional_delay
    conditional_delay(180, 60)
        Parameters
           - 180: time from last boot.
           - 60: the sleep time

    Running the program will show you the calculated values:
        INFO - System uptime : 2018-02-02 23:04:11
        INFO - Current time  : 2018-02-02 23:40:57
        INFO - The diff (sec): 2206

"""
import time
from datetime import datetime
import subprocess
import logging
logging.basicConfig(level=logging.DEBUG, \
        format='%(levelname)s - %(message)s')
#logging.disable(logging.INFO) # REMARK IT TO ENABLE LOGS (INFO)


def conditional_delay(sec_from_last_boot, delay_time):
    """
        conditional_delay check:
        - sys uptime
        - current time
        and decide if he need to sleep the program for a while...
    """
    uptime = subprocess.check_output(["uptime", "-s"])
    uptime = uptime.strip()
    fmt = '%Y-%m-%d %H:%M:%S'
    startup_time = datetime.strptime(uptime, fmt)
    log_msg = "System uptime : " + str(startup_time)
    logging.info(log_msg)
    current_time = datetime.now()
    log_msg = "Current time  : " + str(current_time)[0:19]
    logging.info(log_msg)
    time_diff = (current_time - startup_time)
    if time_diff.days == 0:
        time_in_seconds = time_diff.seconds
    else:
        time_in_seconds = time_diff.days * 24 * 3600
    log_msg = "The diff (sec): " + str(time_in_seconds)
    logging.info(log_msg)
    if time_in_seconds < sec_from_last_boot:
        time.sleep(delay_time)

def main():
    """
        conditional_delay - sleep the program if its start running
        after sys restart
    """
    conditional_delay(180, 60)


if __name__ == "__main__":
    main()

