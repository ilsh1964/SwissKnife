#!/usr/bin/python
r"""
   This Script run several tests on FileUtil class

   Ver: 1.6      2015-01-18
       - Adapt to FileUtil Version 1.6

   Developer: ilan.shavit@gmail.com

"""
from FileUtil import FileUtil

def main():
    """
       main test the FileUtil class.

    """
    file1 = FileUtil('test_file.txt')
    print "\n\nself.readlines():"
    print file1.readlines()

    clean_list = file1.readlines_clean()
    print "\n\nself.readlines_clean():"
    print clean_list

    file1.replace_string_in_file("alon", "ilan")
    print "\n\nself.replace_string_in_file('alon', 'ilan'):"
    print file1.readlines()

    print "\n\nself.return_string_in_lines('ilan\\S*'):"
    print file1.return_string_in_lines("ilan\\S*")

    file1.append_file("THIS IS THE APPENDED LINE")
    print "\n\nself.append_file('THIS IS THE APPENDED LINE'):"
    print file1.readlines()

    file2 = FileUtil('output_file.csv')
    input_list = file1.readlines()
    file2.create_csv_file_from_list(input_list)

    file3 = FileUtil('output_file.bak')
    file3.writelines(file1.readlines())
    print "\n\nSelf.writelenes('output_file.bak') \n\n"

    print "Colums 2, delimetar=' ':", file1.read_column(1, " "), "\n\n"


if __name__ == "__main__":
    main()

