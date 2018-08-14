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

MODULES = 'Modules'

PROTOCOLS = 'Protocols'
PROTOCOL_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_protocol_template"
protocol_filename = 'Protocols.swift'
protocol_file_content = ''

PRESENTER = 'Presenter'
PRESENTER_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_presenter_template"
presenter_file_content = ''
presenter_filename = 'Presenter.swift'


VIEW = 'View'
VIEW_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_view_template"
view_file_content = ''
view_filename = 'View.swift'


DATAMANAGER = 'DataManager'
LOCAL_DATA_MANAGER_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_localdatamanager_template"
local_data_manager_file_content = ''
local_data_manager_filename = 'LocalDataManager.swift'

REMOTE_DATA_MANAGER_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_remotedatamanager_template"
remote_data_manager_file_content = ''
remote_data_manager_filename = 'RemoteDataManager.swift'


INTERACTOR = 'Interactor'
INTERACTOR_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_interactor_template"
interactor_file_content = ''
interactor_filename = 'Interactor.swift'

WIREFRAME = 'WireFrame'
WIREFRAME_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_wireframe_template"
wireframe_file_content = ''
wireframe_filename = 'WireFrame.swift'

TEMPLATE_FOLDER = "template/"
module = ''
root_path = ''
folders = [DATAMANAGER, INTERACTOR, PRESENTER, PROTOCOLS, VIEW, WIREFRAME]

def createFolder ():
	print root_path
	if not os.path.isdir(MODULES):
		os.makedirs(MODULES)

	if not os.path.isdir(root_path):
		os.makedirs(root_path)	


	for folder in folders:
		print root_path + folder
		if not os.path.isdir(root_path + folder):
			os.makedirs(root_path + folder)

def multiple_replace(string, rep_dict):
	pattern = re.compile("|".join([re.escape(k) for k in sorted(rep_dict,key=len,reverse=True)]), flags=re.DOTALL)
	return pattern.sub(lambda x: rep_dict[x.group(0)], string)

def createFile(fileName, content):
	text_file = open(fileName, "w")
	text_file.write(content)
	text_file.close()

def getFileContent(file):
	fileContent = ""
	try:
		gcontext = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
		data = urllib2.urlopen(file, context=gcontext).read(20000)
		#data = data.split("\n")
		fileContent=data.strip()
	except urllib2.HTTPError as e:
		print('HTTPError = ' + str(e.code))
	except urllib2.URLError as e:
		print('URLError = ' + str(e.reason))
	except Exception as e:
		print('generic exception: ' + str(e))
	return fileContent

#coding start

if len(sys.argv) >= 2:
	module=str(sys.argv[1])
	#init root Path
	root_path = MODULES + "/" + module + "/"
	#creatae viepr folders
	createFolder()
	os.system("ls")

	replacement = { "[MODEL]" : module }

	#PROTOCOLS operations BEGIN
	protocol_filename = module + protocol_filename
	print protocol_filename
	#model protocol replacement
	protocol_file_content =  multiple_replace(getFileContent(PROTOCOL_TEMPLATE),  replacement)
	#print protocol_file_content
	#protocols file create 
	protocol_file_path = root_path + PROTOCOLS + "/" + protocol_filename
	#print protocol_file_path 
	createFile(protocol_file_path,protocol_file_content)
	#PROTOCOLS operations END


	#PRESENTER operations BEGIN
	presenter_filename = module + presenter_filename
	print presenter_filename
	#model presenter replacement
	presenter_file_content =  multiple_replace(getFileContent(PRESENTER_TEMPLATE),  replacement)
	presenter_file_path = root_path + PRESENTER + "/" + presenter_filename
	createFile(presenter_file_path,presenter_file_content)
	#PRESENTER operations END


	#VIEW operations BEGIN
	view_filename = module + view_filename
	print view_filename
	#model view replacement
	view_file_content =  multiple_replace(getFileContent(VIEW_TEMPLATE),  replacement)
	view_file_path = root_path + VIEW + "/" + view_filename
	createFile(view_file_path,view_file_content)
	#VIEW operations END
	

	#LOCAL_DATA_MANAGER operations BEGIN
	local_data_manager_filename = module + local_data_manager_filename
	print local_data_manager_filename
	#model local_data_manager replacement
	local_data_manager_file_content =  multiple_replace(getFileContent(LOCAL_DATA_MANAGER_TEMPLATE),  replacement)
	local_data_manager_file_path = root_path + DATAMANAGER + "/" + local_data_manager_filename
	createFile(local_data_manager_file_path,local_data_manager_file_content)
	#LOCAL_DATA_MANAGER operations END

	#REMOTE_DATA_MANAGER operations BEGIN
	remote_data_manager_filename = module + remote_data_manager_filename
	print remote_data_manager_filename
	#model local_data_manager replacement
	remote_data_manager_file_content =  multiple_replace(getFileContent(REMOTE_DATA_MANAGER_TEMPLATE),  replacement)
	remote_data_manager_file_path = root_path + DATAMANAGER + "/" + remote_data_manager_filename
	createFile(remote_data_manager_file_path,remote_data_manager_file_content)
	#REMOTE_DATA_MANAGER operations END


	#INTERACTOR operations BEGIN
	interactor_filename = module + interactor_filename
	print interactor_filename
	#model interactor replacement
	interactor_file_content =  multiple_replace(getFileContent(INTERACTOR_TEMPLATE),  replacement)
	interactor_file_path = root_path + INTERACTOR + "/" + interactor_filename
	createFile(interactor_file_path,interactor_file_content)
	#INTERACTOR operations END

	#WIREFRAME operations BEGIN
	wireframe_filename = module + wireframe_filename
	print wireframe_filename
	#model wirefamre replacement
	wireframe_file_content =  multiple_replace(getFileContent(WIREFRAME_TEMPLATE),  replacement)
	wireframe_file_path = root_path + WIREFRAME + "/" + wireframe_filename
	createFile(wireframe_file_path,wireframe_file_content)
	#WIREFRAME operations END







#os.system("ls")
#os.system("rm -rf " + param)

#os.path.isdir("/home/el")
#print type(protocol_file_content)





















	   		