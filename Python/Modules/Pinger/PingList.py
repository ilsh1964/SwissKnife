#!/usr/bin/env python
"""
    PingList Version 1.2 (2014-04-24)- ping to list of IP addresses

    PingList implement threads to ping the IP addresses
    The attrubute thread_count determone a number of threads (default is 5)
"""

import subprocess
import threading

def ping(ip_address):
    """
        Function that ping a single ip_address
        It return True in successfull ping

    """
    print "ping %s" % ip_address
    ret = subprocess.call(['ping', '-c', '1', '-W', '1', ip_address],
                          stdout=open('/dev/null', 'w'),
                          stderr=open('/dev/null', 'w'))
    return ret == 0


class PingList(object):
    """
        Ping a list of ip addresses
        return Dictionary of good IP addresses
        thread_count = number of threads of ping (default = 5)
    """

    status = {'alive': [], 'dead': []} # Populated while we are running
    hosts = [] # List of all hosts/ips in our input queue
    thread_count = 5 # How many ping process at the time.
    lock = threading.Lock() # Lock object to keep track the threads in loops

    def pop_queue(self):
        """
            This method return one IP address from the queue
        """
        ip_address = None
        self.lock.acquire() # Grab a lock to disable another threads.
        if self.hosts:
            ip_address = self.hosts.pop()
        self.lock.release() # Release the lock for enable another thread
        return ip_address

    def dequeue(self):
        """
            This method scan all IP addresses.
            It return 'Alive'\'Dead' to status dictionary
        """
        while True:
            ip_address = self.pop_queue()
            if not ip_address:
                return None
            result = 'alive' if ping(ip_address) else 'dead'
            self.status[result].append(ip_address)

    def start(self):
        """
            This method responsible to the threading.
            It return dictionary that contain list of 'Alive'\'Dead' objects
        """
        threads = [] # list of threads
        for dummy_i in range(self.thread_count):
            thread_object = threading.Thread(target=self.dequeue)
            thread_object.start()
            threads.append(thread_object)

        # Wait until all the threads are done
        dummy_i = [thread_object.join() for thread_object in threads]
        return self.status

