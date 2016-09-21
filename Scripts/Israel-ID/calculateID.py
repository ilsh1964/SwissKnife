#!/usr/bin/python
"""
    This program calculates the Israeli ID check number.
    Version: 0.1
    Written By Shavit Ilan.

"""

import sys, string, re

def checkID():
    error=False
    if len(sys.argv) <> 2:
        print "Error: Missing argument (Usage: id ID_Number\n"
    else:
        idNumber=sys.argv[1]
        for oneDigit in idNumber:
            if not(oneDigit in string.digits):
                error=True
                break
        if error:
            print "Error: Illegal ID number: '%s'\n" % idNumber
        else:
            if len(idNumber) > 8:
                error=True
                print "Error: ID number too long: '%s'\n" % idNumber
    return error
 
badNumber = checkID()
newID = ''
if not badNumber:
    if len(sys.argv[1]) < 8:
        missingDigits = 8 - len(sys.argv[1])
        while missingDigits > 0:
            newID=newID+'0'
	    missingDigits = missingDigits - 1
        newID = newID + sys.argv[1]
    else:
        newID = sys.argv[1]
        
    theSum = 0
    indexRange=[0,2,4,6]
    for i in indexRange:
        digit = newID[i]
        num= int(digit)
        theSum = theSum + num
        num= int(newID[i+1]) * 2
        if num > 9:
            num1 = num / 10
            num2 = num % 10
            num = num1 + num2
        theSum = theSum + num
    lastDigit = theSum % 10
    if lastDigit <> 0:
        lastDigit = 10 - lastDigit
    print '\nYour full ID number is: %s%s\n\n\n' % (str(newID),str(lastDigit))
