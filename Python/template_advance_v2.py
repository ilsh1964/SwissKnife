#!/usr/bin/env  python2
# -*- coding: utf-8 -*-
"""
    Program Title here
    Ver:

   Developer: Shavit Ilan (ilansh5@bezeq.co.il)
"""

### import section ###
import time
import logging
import mysql.connector
# ubuntu: apt install python-mysql.connector
logging.basicConfig(filename='filename.log', level=logging.DEBUG,\
                    format='%(asctime)s:%(levelname)s:%(message)s')

class TemplateClass(object):
    """
        class explaination
    """

    def __init__(self):
        """
        remarks
        """
        try:
            self.the_db = mysql.connector.connect(host="127.0.0.1",\
                    user="root", passwd="", db="mysql")
            self.cursor = self.the_db.cursor()
        except  mysql.connector.Error as mysql_error:
            log_message = "Mysql Error: %s" % mysql_error
            logging.critical(log_message)

    def run_select_command(self, the_cmd):
        """
            remarks
        """
        try:
            self.cursor.execute(the_cmd)
            return self.cursor.fetchall()
        except  mysql.connector.Error as mysql_error:
            log_message = "Mysql Error: %s" % mysql_error
            logging.critical(log_message)

    def run_commit_command(self, the_cmd):
        """
            remarks
        """
        try:
            self.cursor.execute(the_cmd)
            self.the_db.commit()
        except  mysql.connector.Error as mysql_error:
            log_message = "Mysql Error: %s" % mysql_error
            logging.critical(log_message)


def main():
    """
        Explain the function of the main program
    """
    time.sleep(0.1)
    logging.warning("template_advance_v2 started")
    template_object = TemplateClass()
    result = template_object.run_select_command("select * from user")
    for each_item in result:
        print each_item


if __name__ == "__main__":
    main()

