# Timestamp-Files

### To create a new timestamp (backup) to "the_filename" file:
    $ ./ts -c the_filename 
    
### To rename "the_filename" file to "the_filename_timestamp"
    $ ./ts -m the_filename 

### Add run permission to ts script:
    $ chmod +x ts

### In case of illegal argument the script will show it's Usage:
    $ Usage: ts -c filename
             ts -m filename
