#!/usr/bin/env python
# -*- coding: utf-8 -*-
r"""
    create_chart_from_sqlite.py

    Ver: 0.1
    create_chart_from_sqlite is a python script that draw chart from CSV file
    You can popup the chart and\or save it to an image file

    Developer: Shavit Ilan (ilan.shavit@gmail.com)
"""

from ConfigParser import SafeConfigParser
import sqlite3
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.dates as mdates


def main():
    """
       In the main we read the configuration file and directly draw the graph
    """

    # Initialize Parser
    parser = SafeConfigParser()
    parser.read('create_chart_from_sqlite.ini')
    save_graph = parser.get('CONFIG', 'SAVE_GRAPH_IMAGE')
    show_popup = parser.get('CONFIG', 'SHOW_POPUP_GRAPH')

    db_filename = parser.get('CONFIG', 'DB_FILENAME')
    conn = sqlite3.connect(db_filename)
    temp_c = conn.cursor()
    temp_c.execute("select df, time from df;")
    all_raws = temp_c.fetchall()

    graph_array = []
    for each_raw in all_raws:
        raw_data = str(each_raw[1][0:19]) + ',' + str(each_raw[0])
        graph_array.append(raw_data)


    value, datestamp = np.loadtxt(graph_array, delimiter=',', unpack=True,\
                 converters={0: mdates.strpdate2num('%Y-%m-%d %H:%M:%S')})

    plt.subplots_adjust(bottom=0.35)
    plt.xticks(rotation=90)

    temp_ax = plt.gca()
    xfmt = mdates.DateFormatter('%Y-%m-%d %H:%M:%S')
    temp_ax.xaxis.set_major_formatter(xfmt)

    plt.plot(value, datestamp, linewidth=2)

    if save_graph == 'Y':
        image_filename = parser.get('CONFIG', 'IMAGE_FILENAME')
        plt.savefig(image_filename)
    if show_popup == 'Y':
        plt.show()


if __name__ == "__main__":
    main()
