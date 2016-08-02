#!/usr/bin/env  python2
# -*- coding: utf-8 -*-
"""
    Program Title here
    Ver:

   Developer: Shavit Ilan (ilansh5@bezeq.co.il)
"""


### import section ###
import logging
from ConfigParser import SafeConfigParser
from datetime import datetime



### functions section ###
def get_timestamp():
    """
        return timestamp in this format '2012-12-07 17:45:57'
    """
    timestamp = str(datetime.now())
    return timestamp[0:19]



def main():
    """
        Explain the function of the main program
    """

    # Initialize Parser
    parser = SafeConfigParser()
    parser.read('template_advance.ini')
    log_file = parser.get('CONFIG', 'LOG_FILE')
    debug_mode = parser.get('CONFIG', 'DEBUG_MODE')

    # Initialize  logging (Usage: logging.debug\info\warning\error\critical)
    if debug_mode == 'debug':
        logging.basicConfig(filename=log_file, level=logging.DEBUG)
    elif debug_mode == 'info':
        logging.basicConfig(filename=log_file, level=logging.INFO)
    elif debug_mode == 'warning':
        logging.basicConfig(filename=log_file, level=logging.WARNING)
    elif debug_mode == 'error':
        logging.basicConfig(filename=log_file, level=logging.ERROR)
    else:
        logging.basicConfig(filename=log_file, level=logging.CRITICAL)
    logging.debug("%s - main started" % get_timestamp())

    # start program here...



if __name__ == "__main__":
    main()

