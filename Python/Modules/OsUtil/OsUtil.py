#!/usr/bin/python
"""
   OsUtil Ver 0.3      2015-05-23

   Developer: ilan.shavit@gmail.com
"""
import os
import subprocess
from datetime import datetime


class OsUtil(object):
    r"""
    OsUtil manipulate system commands vs OS

        General usage:
        =============
        from OsUtil import OsUtil
        fh=OsUtil()
        fh.THE_METHOD()

        - get_timestamp(self):
             fh.get_timestamp() ===>
               '2012-12-07 17:45:57'

        - def run_command_return_stringi_v1(self, cmd):
             fh.run_command_return_string("ls -l") ===>
               total 16
               -rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 OsUtil.py
               -rw------- 1 ilan ilan 2794 Jan 11 12:46 OsUtil.pyc

        - def run_command_return_string_v2(self, cmd):
             fh.run_command_return_string("ls -l") ===>
               total 16
               -rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 OsUtil.py
               -rw------- 1 ilan ilan 2794 Jan 11 12:46 OsUtil.pyc

        - def run_command_return_list(self, cmd):
             fh.run_command_return_list("ls -l")   ===>
               ['total 16', '-rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 O.py']

        - def run_command_return_success(self, cmd):
               fh.run_command_return_success("some_progtam")  ===>
                True \ False according to the success of the command

    """

    def __init__(self):
        """
        Initialize the class

        """
        self.result = ''


    def get_timestamp(self):
        """
        This method return timestamp in this format:
        '2012-12-07 17:45:57'
        """
        self.result = str(datetime.now())[0:19]
        return self.result


    def run_command_return_string_v1(self, cmd):
        """
            run cmd and return the result as string
            This version use python check_output method

            Usage:
                from OsUtil import OsUtil
                fh=OsUtil()
                fh.run_command_return_string_v1("ls -l") ===>
                      total 16
                      -rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 OsUtil.py
                      -rw------- 1 ilan ilan 2794 Jan 11 12:46 OsUtil.pyc

        """
        fnull = open(os.devnull, "w")
        self.result = subprocess.check_output(cmd.split())
        fnull.close()
        return self.result


    def run_command_return_string_v2(self, cmd):
        """
            run cmd and return the result as string
            This version use python popen method

            Usage:
                from OsUtil import OsUtil
                fh=OsUtil()
                fh.run_command_return_string_v2("ls -l") ===>
                      total 16
                      -rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 OsUtil.py
                      -rw------- 1 ilan ilan 2794 Jan 11 12:46 OsUtil.pyc

        """
        fnull = open(os.devnull, "w")
        proc = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE,  \
                                stderr=fnull)
        self.result = proc.communicate()[0]
        fnull.close()
        return self.result


    def run_command_return_list(self, cmd):
        """
            run cmd and return the result as list

            Usage:
                from OsUtil import OsUtil
                fh=OsUtil()
                fh.run_command_return_list("ls -l")   ===>
                ['total 16', '-rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 O.py']
        """
        self.result = subprocess.check_output(cmd.split()).split('\n')
        return self.result



    def run_command_return_success(self, cmd):
        """
            run cmd on OS only. No return

            Usage:
                from OsUtil import OsUtil
                fh=OsUtil()
                fh.run_command_return_success("some_program")
        """
        fnull = open(os.devnull, "w")
        self.result = subprocess.call(cmd.split(), stdout=fnull, stderr=fnull)
        fnull.close()
        if self.result == 0:
            return True
        else:
            return False


def main():
    """
        In this main program we will demonstrate how to works with
        this class
    """

    temp_fh = OsUtil()
    print "Start testing: " + temp_fh.get_timestamp()
    print
    print 'run_command_return_string_v1("ls -l")'
    print temp_fh.run_command_return_string_v1("ls -l")

    print
    print 'run_command_return_string_v2("ls -l")'
    print temp_fh.run_command_return_string_v2("ls -l")

    print
    print 'run_command_return_list("ls -l")'
    print temp_fh.run_command_return_list("ls -l")

    print
    print 'run_command_return_success("sleep 2")'
    print temp_fh.run_command_return_success("sleep 2")

    print
    print 'run_command_return_success("ls /xxxx")'
    print temp_fh.run_command_return_success("ls xxxx")

if __name__ == "__main__":
    main()
