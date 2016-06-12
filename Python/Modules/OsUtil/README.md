# OsUtil.py - Run OS Commands
### Class that provides easy way to run commands in the host OS
    $ General Usage:
          from OsUtil import OsUtil
          fh=OsUtil()
          fh.THE_METHOD()

    $ fh.get_timestamp() 
           '2012-12-07 17:45:57'

    $ fh.run_command_return_string_v1("ls -l")
           total 16
           -rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 OsUtil.py
           -rw------- 1 ilan ilan 2794 Jan 11 12:46 OsUtil.pyc

    $ fh.run_command_return_string_v2("ls -l")
           total 16
           -rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 OsUtil.py
           -rw------- 1 ilan ilan 2794 Jan 11 12:46 OsUtil.pyc

    $ fh.run_command_return_list("ls -l")
           ['total 16', '-rwx--x--x 1 ilan ilan 2506 Jan 11 13:00 O.py']

    $ fh.run_command_return_success("sleep 10")
           True \ False    (according the success of running the above command


