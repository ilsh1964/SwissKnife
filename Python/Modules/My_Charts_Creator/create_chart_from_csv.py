#!/usr/bin/env python
# -*- coding: utf-8 -*-
r"""
    create_chart_from_csv.py

    Ver: 0.1
    create_chart_from_csv is a python script that draw chart from CSV file
    You can popup the chart and\or save it to an image file

    Developer: Shavit Ilan (ilan.shavit@gmail.com)
"""

from ConfigParser import SafeConfigParser
import matplotlib.pyplot as plt


def main():
    """
       In the main we read the configuration file and directly draw the graph
    """

    # Initialize Parser
    parser = SafeConfigParser()
    parser.read('create_chart_from_csv.ini')
    the_title = parser.get('CONFIG', 'TITLE')
    x_title = parser.get('CONFIG', 'X_TITLE')
    y_title = parser.get('CONFIG', 'Y_TITLE')
    save_graph = parser.get('CONFIG', 'SAVE_GRAPH_IMAGE')
    show_popup = parser.get('CONFIG', 'SHOW_POPUP_GRAPH')

    x_ray = []
    y_ray = []
    csv_filename = parser.get('CONFIG', 'CSV_FILENAME')
    in_file = open(csv_filename, 'r')
    all_lines = in_file.readlines()
    in_file.close()
    for each_line in all_lines:
        splited_line = each_line.split(',')
        x_ray.append(int(splited_line[0]))
        y_ray.append(int(splited_line[1].replace('\n', '')))

    plt.plot(x_ray, y_ray, "blue", linewidth=2)
    plt.title(the_title)
    plt.xlabel(x_title)
    plt.ylabel(y_title)
    if save_graph == 'Y':
        image_filename = parser.get('CONFIG', 'IMAGE_FILENAME')
        plt.savefig(image_filename)
    if show_popup == 'Y':
        plt.show()


if __name__ == "__main__":
    main()
