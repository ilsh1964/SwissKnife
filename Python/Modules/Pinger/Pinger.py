"""
    Pinger Version 1.3 (2014-10-27)- ping to list of IP addresses

    Pinger implement threads to ping the IP addresses
    The attrubute thread_count determone a number of threads (default is 5)
"""

import subprocess
import threading
import time
import os
from OsUtil import OsUtil
fh=OsUtil()


class Pinger(object):
    """
        Ping a list of ip addresses
        return Dictionary of good IP addresses
        thread_count = number of threads of ping (default = 5)
    """

    status = {'alive': [], 'dead': []} # Populated while we are running
    hosts = [] # List of all hosts/ips in our input queue
    thread_count = 5 # How many ping process at the time.
    lock = threading.Lock() # Lock object to keep track the threads in loops


    def ping(self, ip):
        """
            Function that ping a single ip
            It return True in successfull ping

        """
        cmd = "ping  %s" % ip
        ret = fh.run_command_return_string_v2(cmd)
        if  not('Sent = 4, Received = 4, Lost = 0 (0% loss)' in ret) or ('TTL expired' in ret) or ('unreachable' in ret):
            time.sleep(2)
            ret = fh.run_command_return_string_v2(cmd)
            if  not('Sent = 4, Received = 4, Lost = 0 (0% loss)' in ret) or ('TTL expired' in ret) or ('unreachable' in ret):
                print "\n%s\t: Bad" % ip
                return False
            else:
                pass
        print "\n%s\t: Good" % ip
        return True
        

    def pop_queue(self):
        """
            This method return one IP address from the queue
        """
        ip = None
        self.lock.acquire() # Grab a lock to disable another threads.
        if self.hosts:
            ip = self.hosts.pop()
        self.lock.release() # Release the lock for enable another thread
        return ip

    def dequeue(self):
        """
            This method scan all IP addresses.
            It return 'Alive'\'Dead' to status dictionary
        """
        while True:
            ip = self.pop_queue()
            if not ip:
                return None
            result = 'alive' if self.ping(ip) else 'dead'
            self.status[result].append(ip)
                

    def start(self):
        """
            This method responsible to the threading.
            It return dictionary that contain list of 'Alive'\'Dead' objects
        """
        threads = [] # list of threads
        for i in range(self.thread_count):
            t = threading.Thread(target=self.dequeue)
            t.start()
            threads.append(t)

        # Wait until all the threads are done
        [ t.join() for t in threads ]
        return self.status

