#!/usr/bin/python
r"""
   FileUtil
       This class help you with manipulating text\csv files

   Ver: 1.6      2015-01-18
       - Use with statement instead of old and absolte method
       - Add new readlines_clean method


   Developer: ilan.shavit@gmail.com
"""
import re

class FileUtil(object):
    """
    FileUtil manipulate text files

        - __init__(self, filename): Initialize the object with the file name

        - readlines(self): Read the file and return it as list

        - readlines_clean(self): Read the file, return a list without '\n'

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
        with open(self.filename, "r") as in_file:
            all_lines = in_file.readlines()
            return all_lines

    def readlines_clean(self):
        """
        Read the file, return a list without '\n'

        """
        all_lines = self.readlines()
        new_lines = []
        for each_line in all_lines:
            new_lines.append(each_line.strip())
        return new_lines

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
        with open(self.filename, "w") as out_file:
            out_file.writelines(["%s" % item  for item in source_list])

    def writelines_with_cr(self, source_list):
        """
        Write list's items to file. add '\n' to each list item

        """
        with open(self.filename, "w") as out_file:
            out_file.writelines(["%s\n" % item  for item in source_list])

    def replace_string_in_file(self, source, dest):
        """
        Replace string in the file.
        The file will be updated with the new data

        """
        all_lines = self.readlines()
        with open(self.filename, "w") as out_file:
            for line in all_lines:
                if source in line:
                    out_file.write(line.replace(source, dest))
                else:
                    out_file.write(line)
        out_file.close()

    def return_string_in_lines(self, pattern):
        """
        Scan the file and return a list containing the raws
        that match the regex pattern

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
        with open(self.filename, "a") as out_file:
            out_file.write(line + "\n")

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
