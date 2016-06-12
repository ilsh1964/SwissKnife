#!/usr/bin/env python
"""
    Pinger run ping test (with threadings) to several IP addresses

    It use two classes:
    FileUtil - for working with in/out files
    PingList - for running ping tests to list of IP's

    Input file: in_file.csv contain list of IP addresses
    Output files:
       BAD_IP.txt: contain list of bad IP addresses
       GOOD_IP.txt: contain list of good IP addresses

"""

from PingList import PingList
from FileUtil import FileUtil

def main():
    """
       Read list of IP addresses, run ping test and generate the output files
    """
    good_ip = FileUtil('GOOD_IP.txt')
    bad_ip = FileUtil('BAD_IP.txt')
    host_file = FileUtil('in_file.csv')
    ip_list = host_file.read_column(0, ",")

    ping_object = PingList()
    ping_object.thread_count = 8
    ping_object.hosts = ip_list
    ping_object.start()
    for host in ping_object.status['alive']:
        good_ip.append_file(host)
    for host in ping_object.status['dead']:
        bad_ip.append_file(host)


if __name__ == '__main__':
    main()

