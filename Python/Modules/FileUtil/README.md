# FileUtil.py - ֵֵManipulating Text Files
### Class that provide new functionality for file manipulation
    $ __init__(self, filename)
        Initialize the object with the file name
    $ readlines(self)
        Read the file and return it as list
    $ readlines_clean(self):
        Read the file, return a list without '\n'
    $ read_column(self, col_num, delimeter):
        return col_num as list. Raise ColumnError if column exist in a raw
    $ writelines(self, source_list)
        Write list's items to file
    $ writelines_with_cr(self, source_list)
        Write list's items to file. add '\n' to each list item
    $ replace_string_in_file(self, source, dest)
        Replace string in the file. The file will be updated with the new data
    $ return_string_in_lines(self, pattern)
        Scan the file and return a list containing the raws that match the pattern
    $ def append_file(self, line)
        Append line to the file
    $ create_csv_file_from_list(self, input_list)
        Create csv file from input_list

