#!/usr/bin/python
"""
   FileUtil Ver 1.5      2014-04-24

   Developer: ilan.shavit@gmail.com
"""
import re

class FileUtil(object):
    """
    FileUtil manipulate text files

        - __init__(self, filename): Initialize the object with the file name

        - readlines(self): Read the file and return it as list

        - read_column(self, col_num, delimeter): return col_num as list. Raise
                     ColumnError if column not exist in a raw

        - writelines(self, source_list): Write list's items to file

        - writelines_with_cr(self, source_list): Write list's items to file.
          add '\n' to each list item

        - replace_string_in_file(self, source, dest): Replace string in
             file. The file will be updated with the new data

        - return_string_in_lines(self, pattern) - Scan the file and return
          a list containing the raws that match the pattern

        - append_file(self, line): Append line to the file

        - create_csv_file_from_list(self, input_list): Create csv file
             from input_list

    """

    def __init__(self, filename):
        """
        Initialize the object with the file name

        """
        self.filename = filename

    def readlines(self):
        """
        Read the file and return it as list

        """
        in_file = open(self.filename, "r")
        all_lines = in_file.readlines()
        in_file.close()
        return all_lines

    def read_column(self, col_num, delimeter):
        """
        Return col_num as list.
        Raise ColumnError if column exist in a raw
        """
        all_lines = self.readlines()
        items = []
        for line in all_lines:
            try:
                split_line = line.split(delimeter)
                items.append(split_line[col_num])
            except:
                raise NameError('ColomnError')
        return items

    def writelines(self, source_list):
        """
        Write list's items to file

        """
        out_file = open(self.filename, "w")
        out_file.writelines(["%s" % item  for item in source_list])
        out_file.close()

    def writelines_with_cr(self, source_list):
        """
        Write list's items to file. add '\n' to each list item

        """
        out_file = open(self.filename, "w")
        out_file.writelines(["%s\n" % item  for item in source_list])
        out_file.close()

    def replace_string_in_file(self, source, dest):
        """
        Replace string in the file.
        The file will be updated with the new data

        """
        all_lines = self.readlines()
        out_file = open(self.filename, "w")
        for line in all_lines:
            if source in line:
                out_file.write(line.replace(source, dest))
            else:
                out_file.write(line)
        out_file.close()

    def return_string_in_lines(self, pattern):
        """
        Scan the file and return a list containing the raws
        that match the pattern

        """
        req_list = []
        all_lines = self.readlines()
        regex = re.compile(pattern)
        for line in all_lines:
            if not regex.findall(line) == []:
                req_list.append(line)
        return req_list

    def append_file(self, line):
        """
        Append line to the file

        """
        out_file = open(self.filename, "a")
        out_file.write(line + "\n")
        out_file.close()

    def create_csv_file_from_list(self, input_list):
        """
        Create csv file from input_list

        """
        out_file = open(self.filename, "w")
        seperator = ","
        for item in input_list:
            splited_line = item.split()
            join_line = seperator.join(splited_line)
            out_file.write(join_line + "\n")
        out_file.close()
