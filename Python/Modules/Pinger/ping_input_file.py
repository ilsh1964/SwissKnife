'''
Pinger: Run pings to all hosts in input.csv file
        Version 1.0 RC1    ilan.shavit@gmail.com
'''
import datetime
from ConfigParser import SafeConfigParser
from Pinger import Pinger


def get_timestamp():
    '''
    Retrun the timestamp
    '''
    timestamp = str(datetime.datetime.now())
    return timestamp[0:19]


def legal_ip(the_ip):
    '''
    Check if the provided ip is legal
    '''
    try:
        split_ip = the_ip.split(".")
        part1 = int(split_ip[0])
        part2 = int(split_ip[1])
        part3 = int(split_ip[2])
        part4 = int(split_ip[3])
        if (part1 >= 0) and (part1 < 256) and \
            (part2 >= 0) and (part2 < 256) and \
            (part3 >= 0) and (part3 < 256) and \
            (part4 >= 0) and (part4 < 256):
            return True
        else:
            return False
    except IndexError:
        return False


def main():
    '''
    Run pings to all hosts in input.csv file
    '''
    parser = SafeConfigParser()
    parser.read('Pinger.ini')
    num_threads = int(parser.get('IPSCAN', 'NUM_THREADS'))
    ping_object = Pinger()
    ping_object.thread_count = num_threads
    print "\n\n%s - Start pinging hosts in 'input.csv' (%s threads)...\n" % \
                                              (get_timestamp(), num_threads)
    ip_list = []
    ignore_list = []

    with open('input.csv', 'r') as in_file:
        all_lines = in_file.readlines()

    for each_line in all_lines:
        the_ip = each_line.strip()
        if legal_ip(the_ip):
            ip_list.append(the_ip)
        else:
            ignore_list.append(the_ip)


    ping_object.hosts = ip_list
    ping_object.status['dead'] = []
    ping_object.status['alive'] = []
    ping_object.start()
    dead_hosts = ping_object.status['dead']
    dead_hosts.sort()
    alive_hosts = ping_object.status['alive']
    alive_hosts.sort()

    with open('BAD_IP.csv', 'w') as out_file:
        for host in dead_hosts:
            the_string = host + '\n'
            out_file.write(the_string)

    with open('GOOD_IP.csv', 'w') as out_file:
        for host in alive_hosts:
            the_string = host + '\n'
            out_file.write(the_string)

    with open('IGNORE_IP.csv', 'w') as out_file:
        for host in ignore_list:
            the_string = host + '\n'
            out_file.write(the_string)

    print "\n\n%s - End pinging hosts in 'input.csv'(ilan.shavit@bezeq.co.il)"\
                                                            % get_timestamp()



if __name__ == "__main__":
    main()
