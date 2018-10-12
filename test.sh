#! /bin/sh
""":"
exec python $0 ${1+"$@"}
"""

import os
import sys
import re
import requests
import urllib2
import ssl


INTERACTOR_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_interactor_template"

def testReadContentOnWeb():
    try:
    	gcontext = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
    	data = urllib2.urlopen(INTERACTOR_TEMPLATE, context=gcontext).read(20000)
    	#data = data.split("\n")
    	print data.strip()
    except urllib2.HTTPError as e:
        print('HTTPError = ' + str(e.code))
    except urllib2.URLError as e:
        print('URLError = ' + str(e.reason))
    except Exception as e:
        print('generic exception: ' + str(e))

testReadContentOnWeb()





#for line in urllib2.urlopen(INTERACTOR_TEMPLATE):
 #print line
 	#fileContent = ""
	#with open(file) as f:
	#	lines = f.readlines()
	#	for line in lines:
	#		fileContent = fileContent + str(line)