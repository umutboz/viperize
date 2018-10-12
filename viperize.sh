#! /bin/sh
""":"
exec python $0 ${1+"$@"}
"""

import os
import sys
import re
import urllib2
import ssl

#2.0.0
#viperize -typeName -parentModuleName -subModule

def constant(f):
    def fset(self, value):
        raise TypeError
    def fget(self):
        return f()
    return property(fget, fset)

class _CodeLine(object):
    @constant
    def NEWLINE():
		return '\n'
    @constant
    def SPACE_AFTER():
        return "    "
    @constant
    def SLASH():
        return "/"

class _DevelopmentEnvoirment(object):
	@constant
	def LOCAL():
		return 'LOCAL'
	@constant
	def ONLINE():
		return 'ONLINE'

class _MessageType(object):
	@constant
	def INFO():
		return 'INFO'
	@constant
	def ERROR():
		return 'ERROR'
	@constant
	def SUCCESS():
		return 'SUCCESS'
#MESSAGE INIT
MESSAGE = _MessageType()
DEV_ENV = _DevelopmentEnvoirment()
CODING = _CodeLine()

def showErrorMessages(messageType,message):
	if intern(MESSAGE.ERROR) is intern(messageType):
		print ('\x1b[6;30;41m' + message + '\x1b[0m')
	elif intern(MESSAGE.SUCCESS) is intern(messageType):
		print ('\x1b[6;30;42m' + message + '\x1b[0m')
	elif intern(MESSAGE.INFO) is intern(messageType):
		print ('\x1b[7;37;40m' + message + '\x1b[0m')

SWIFT = ".swift"
MODULES = 'Modules'

PROTOCOLS = 'Protocols'
PROTOCOL_TEMPLATE = "Viper_protocol_template"
protocol_filename = 'Protocols.swift'
protocol_file_content = ''

PRESENTER = 'Presenter'
PRESENTER_TEMPLATE = "Viper_presenter_template"
presenter_file_content = ''
presenter_filename = 'Presenter.swift'


VIEW = 'View'
VIEW_TEMPLATE = "Viper_view_template"
view_file_content = ''
view_filename = 'View.swift'

''''
DATAMANAGER = 'DataManager'
LOCAL_DATA_MANAGER_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_localdatamanager_template"
local_data_manager_file_content = ''
local_data_manager_filename = 'LocalDataManager.swift'

REMOTE_DATA_MANAGER_TEMPLATE = "https://raw.githubusercontent.com/umutboz/viperize/master/template/Viper_remotedatamanager_template"
remote_data_manager_file_content = ''
remote_data_manager_filename = 'RemoteDataManager.swift'
'''

INTERACTOR = 'Interactor'
INTERACTOR_TEMPLATE = "Viper_interactor_template"
interactor_file_content = ''
interactor_filename = 'Interactor.swift'

WIREFRAME = 'WireFrame'
WIREFRAME_TEMPLATE = "Viper_wireframe_template"
wireframe_file_content = ''
wireframe_filename = 'WireFrame.swift'


#CHILD
CHILD_PROTOCOL_WIREFRAME_MODULE_METHOD_TEMPLATE = "Viper_protocol_wireframeprotocol_createmodule_method_child_inner_template"
CHILD_INTERACTOR_PRESENTER_MODULE_FIELD_TEMPLATE = "Viper_interactor_presenter_field_child_inner_template"
CHILD_INTERACTOR_INNER_MODULE_TEMPLATE = "Viper_interactor_child_inner_template"
CHILD_PROTOCOL_INNER_MODULE_TEMPLATE = "Viper_protocol_child_inner_template"
CHILD_WIFRAME_MODULE_METHOD_INNER_TEMPLATE = "Viper_wireframe_child_inner_template"
CHILD_PRESENTER_TEMPLATE = "Viper_presenter_child_template"
CHILD_VIEW_TEMPLATE = "Viper_view_child_template"
sub_presenter_filename = ""

TEMPLATE_FOLDER = "template/"
ONLINE_FOLDER = "https://raw.githubusercontent.com/umutboz/viperize/master/template/"
parent_module = ''
sub_module = ''
module_type = ''
root_path = ''
parent_module_type = '-p'
sub_module_type = '-s'
folders = [WIREFRAME, INTERACTOR, VIEW ,PRESENTER, PROTOCOLS ]
##CURRENT_DEV_ENV LOCAL OR ONLINE(Github)
CURRENT_DEV_ENV = DEV_ENV.LOCAL
SWIFT = ".swift"
FOR_CHILD_INNER = "//{FOR SUB_IN}"
FOR_CHILD = "//{FOR SUB}"
def initVariables():
    global PROTOCOL_TEMPLATE,PRESENTER_TEMPLATE, WIREFRAME_TEMPLATE,INTERACTOR_TEMPLATE,VIEW_TEMPLATE, CHILD_PROTOCOL_WIREFRAME_MODULE_METHOD_TEMPLATE,CHILD_PROTOCOL_INNER_MODULE_TEMPLATE, CHILD_WIFRAME_MODULE_METHOD_INNER_TEMPLATE,CHILD_PRESENTER_TEMPLATE,CHILD_VIEW_TEMPLATE,CHILD_INTERACTOR_INNER_MODULE_TEMPLATE,CHILD_INTERACTOR_PRESENTER_MODULE_FIELD_TEMPLATE
    online_path = "https://raw.githubusercontent.com/umutboz/viperize/master/template/"
    if intern(DEV_ENV.ONLINE) is intern(CURRENT_DEV_ENV):
        PROTOCOL_TEMPLATE = ONLINE_FOLDER + PROTOCOL_TEMPLATE
        PRESENTER_TEMPLATE = ONLINE_FOLDER + PRESENTER_TEMPLATE
        WIREFRAME_TEMPLATE = ONLINE_FOLDER + WIREFRAME_TEMPLATE
        INTERACTOR_TEMPLATE = ONLINE_FOLDER + INTERACTOR_TEMPLATE
        VIEW_TEMPLATE = ONLINE_FOLDER + VIEW_TEMPLATE
        CHILD_PROTOCOL_INNER_MODULE_TEMPLATE = ONLINE_FOLDER + CHILD_PROTOCOL_INNER_MODULE_TEMPLATE
        CHILD_PROTOCOL_WIREFRAME_MODULE_METHOD_TEMPLATE = ONLINE_FOLDER + CHILD_PROTOCOL_WIREFRAME_MODULE_METHOD_TEMPLATE
        CHILD_WIFRAME_MODULE_METHOD_INNER_TEMPLATE = ONLINE_FOLDER + CHILD_WIFRAME_MODULE_METHOD_INNER_TEMPLATE
        CHILD_PRESENTER_TEMPLATE = ONLINE_FOLDER + CHILD_PRESENTER_TEMPLATE
        CHILD_VIEW_TEMPLATE = ONLINE_FOLDER + CHILD_VIEW_TEMPLATE
        CHILD_INTERACTOR_INNER_MODULE_TEMPLATE = ONLINE + CHILD_INTERACTOR_INNER_MODULE_TEMPLATE
        CHILD_INTERACTOR_PRESENTER_MODULE_FIELD_TEMPLATE = ONLINE + CHILD_INTERACTOR_PRESENTER_MODULE_FIELD_TEMPLATE

    else:
        PROTOCOL_TEMPLATE = TEMPLATE_FOLDER + PROTOCOL_TEMPLATE
        PRESENTER_TEMPLATE = TEMPLATE_FOLDER + PRESENTER_TEMPLATE
        WIREFRAME_TEMPLATE = TEMPLATE_FOLDER + WIREFRAME_TEMPLATE
        INTERACTOR_TEMPLATE = TEMPLATE_FOLDER + INTERACTOR_TEMPLATE
        VIEW_TEMPLATE = TEMPLATE_FOLDER + VIEW_TEMPLATE
        CHILD_PROTOCOL_WIREFRAME_MODULE_METHOD_TEMPLATE = TEMPLATE_FOLDER + CHILD_PROTOCOL_WIREFRAME_MODULE_METHOD_TEMPLATE
        CHILD_PROTOCOL_INNER_MODULE_TEMPLATE = TEMPLATE_FOLDER + CHILD_PROTOCOL_INNER_MODULE_TEMPLATE
        CHILD_WIFRAME_MODULE_METHOD_INNER_TEMPLATE = TEMPLATE_FOLDER + CHILD_WIFRAME_MODULE_METHOD_INNER_TEMPLATE
        CHILD_PRESENTER_TEMPLATE = TEMPLATE_FOLDER + CHILD_PRESENTER_TEMPLATE
        CHILD_VIEW_TEMPLATE = TEMPLATE_FOLDER + CHILD_VIEW_TEMPLATE
        CHILD_INTERACTOR_INNER_MODULE_TEMPLATE = TEMPLATE_FOLDER + CHILD_INTERACTOR_INNER_MODULE_TEMPLATE
        CHILD_INTERACTOR_PRESENTER_MODULE_FIELD_TEMPLATE = TEMPLATE_FOLDER + CHILD_INTERACTOR_PRESENTER_MODULE_FIELD_TEMPLATE
def createFolder ():
	showErrorMessages(MESSAGE.INFO,root_path)
	if not os.path.isdir(MODULES):
		os.makedirs(MODULES)

	if not os.path.isdir(root_path):
		os.makedirs(root_path)

	for folder in folders:
		showErrorMessages(MESSAGE.INFO,root_path + folder)
		if not os.path.isdir(root_path + folder):
			os.makedirs(root_path + folder)

def validateParentModulePath():
    validateStatus = False
    if os.path.isdir(MODULES):
        validateStatus = True
    validateStatus = False
    if os.path.isdir(root_path):
        validateStatus = True
    for folder in folders:
        validateStatus = False
        if os.path.isdir(root_path + folder):
            validateStatus = True
    return validateStatus

def multiple_replace(string, rep_dict):
	pattern = re.compile("|".join([re.escape(k) for k in sorted(rep_dict,key=len,reverse=True)]), flags=re.DOTALL)
	return pattern.sub(lambda x: rep_dict[x.group(0)], string)

def createFile(fileName, content):
	text_file = open(fileName, "w")
	text_file.write(content)
	text_file.close()

def appendFile(fileName,content,isTruncate=False):
    with open(fileName, "r+") as f:
        #f.seek(0)
        if isTruncate:
            f.truncate()
        f.write(content)
        f.close()

def getFileContent(file):
	fileContent = ""
	if intern(DEV_ENV.LOCAL) is intern(CURRENT_DEV_ENV):
		data = open(os.getcwd() + CODING.SLASH  + file,"r").read(20000) #opens file with name of "test.txt"
		fileContent = data.strip()
		return fileContent
	else:
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

def replaceAndCreateCodingContent(template_file):
    temp_file_content = multiple_replace(getFileContent(template_file),  child_replacement)
    return temp_file_content

def insertOtherString (source_str, insert_str, pos):
    return source_str[:pos]+insert_str+source_str[pos:]

def childInsertMember(childInnerTemplate,insertingModule, subType):
    templateDataPath =  os.getcwd() + CODING.SLASH  + MODULES + CODING.SLASH + parent_module + CODING.SLASH  + insertingModule + CODING.SLASH  + parent_module + insertingModule + SWIFT
    #TODO REMOVE
    removeChildContent(childInnerTemplate = childInnerTemplate, removingModule = insertingModule)

    generic_child_inner_template_content = replaceAndCreateCodingContent(childInnerTemplate)
    data = open(templateDataPath ,"r").read(20000)

    if subType == 0:
        subTypeString = FOR_CHILD_INNER
    else:
        subTypeString = FOR_CHILD

    child_inner_index = str(data.strip()).index(subTypeString) + len(subTypeString) + 1
    if subType == 0:
        fileContent =  insertOtherString(str(data.strip()),CODING.SPACE_AFTER + generic_child_inner_template_content +
    CODING.NEWLINE,child_inner_index)
    else:
        fileContent =  insertOtherString(str(data.strip()),CODING.NEWLINE+CODING.NEWLINE+CODING.SPACE_AFTER + generic_child_inner_template_content +
    CODING.NEWLINE,child_inner_index)
    appendFile(fileName=templateDataPath,content=fileContent)



def removeChildContent(childInnerTemplate,removingModule):
    templateDataPath =  os.getcwd() + CODING.SLASH  + MODULES + CODING.SLASH + parent_module + CODING.SLASH  + removingModule + CODING.SLASH  + parent_module + removingModule + SWIFT
    generic_child_inner_template_content = replaceAndCreateCodingContent(childInnerTemplate)
    #print generic_child_inner_template_content
    data = open(templateDataPath ,"r").read(20000)
    remove_child_replacement = { generic_child_inner_template_content : ""}
    remove_replace_content = data.strip().replace(generic_child_inner_template_content, "" )
    #print remove_replace_content
    appendFile(fileName=templateDataPath,content=remove_replace_content, isTruncate=True)


def createSubModule(module, subTemplateFile,subModuleFileName):
    #WIREFRAME operations BEGIN
	sub_created_filename = parent_module + subModuleFileName
	showErrorMessages(MESSAGE.INFO,sub_created_filename)
	#model wirefamre replacement
	sub_created_file_content =  multiple_replace(getFileContent(subTemplateFile),  child_replacement)
	sub_created_file_path = root_path + module + CODING.SLASH + sub_created_filename
	createFile(sub_created_file_path,sub_created_file_content)
	#WIREFRAME operations END

def createParentModules():
	global protocol_filename,presenter_filename, view_filename,interactor_filename,wireframe_filename
	#PROTOCOLS operations BEGIN
	protocol_filename = parent_module + protocol_filename
	showErrorMessages(MESSAGE.INFO,protocol_filename)
	#model protocol replacement
	protocol_file_content =  multiple_replace(getFileContent(PROTOCOL_TEMPLATE),  replacement)
	#print protocol_file_content
	#protocols file create
	protocol_file_path = root_path + PROTOCOLS + CODING.SLASH + protocol_filename
	#print protocol_file_path
	createFile(protocol_file_path,protocol_file_content)
	#PROTOCOLS operations END

	#PRESENTER operations BEGIN
	presenter_filename = parent_module + presenter_filename
	showErrorMessages(MESSAGE.INFO,presenter_filename)
	#model presenter replacement
	presenter_file_content =  multiple_replace(getFileContent(PRESENTER_TEMPLATE),  replacement)
	presenter_file_path = root_path + PRESENTER + CODING.SLASH  + presenter_filename
	createFile(presenter_file_path,presenter_file_content)
	#PRESENTER operations END

	#VIEW operations BEGIN
	view_filename = parent_module + view_filename
	showErrorMessages(MESSAGE.INFO,view_filename)
	#model view replacement
	view_file_content =  multiple_replace(getFileContent(VIEW_TEMPLATE),  replacement)
	view_file_path = root_path + VIEW + CODING.SLASH  + view_filename
	createFile(view_file_path,view_file_content)
	#VIEW operations END

	#INTERACTOR operations BEGIN
	interactor_filename = parent_module + interactor_filename
	showErrorMessages(MESSAGE.INFO,interactor_filename)
	#model interactor replacement
	interactor_file_content =  multiple_replace(getFileContent(INTERACTOR_TEMPLATE),  replacement)
	interactor_file_path = root_path + INTERACTOR + CODING.SLASH  + interactor_filename
	createFile(interactor_file_path,interactor_file_content)
	#INTERACTOR operations END

	#WIREFRAME operations BEGIN
	wireframe_filename = parent_module + wireframe_filename
	showErrorMessages(MESSAGE.INFO,wireframe_filename)
	#model wirefamre replacement
	wireframe_file_content =  multiple_replace(getFileContent(WIREFRAME_TEMPLATE),  replacement)
	wireframe_file_path = root_path + WIREFRAME + "/" + wireframe_filename
	createFile(wireframe_file_path,wireframe_file_content)
	#WIREFRAME operations END


#coding start

if len(sys.argv) >= 2:
    module_type = str(sys.argv[1])
    parent_module = str(sys.argv[2])
    #set env template sources
    initVariables()
    #init root Path
    root_path = MODULES + CODING.SLASH  + parent_module + CODING.SLASH
    replacement = { "[MODEL]" : parent_module , "[modelLowerCase]" : parent_module.lower()}

    #print module_type, root_path
    if intern(module_type) is intern(parent_module_type):
        #only PARENT parent_module commands
        #creatae viper folders
        createFolder()
        createParentModules()
        os.system("ls")
    elif intern(module_type) is intern(sub_module_type) and len(sys.argv) == 4:
        sub_module = str(sys.argv[3])
        child_replacement = { "[MODEL]" : parent_module , "[modelLowerCase]" : parent_module.lower(), "[SUB]" : sub_module }
        #exist parent module
        if validateParentModulePath():
            #first child protocol inner member
            #Parent WireFrameProtocol define inner child module Method
            #parent_module+Protocols.swift
            childInsertMember(childInnerTemplate=CHILD_PROTOCOL_WIREFRAME_MODULE_METHOD_TEMPLATE,insertingModule=PROTOCOLS, subType=0)
            childInsertMember(childInnerTemplate=CHILD_PROTOCOL_INNER_MODULE_TEMPLATE,insertingModule=PROTOCOLS, subType=1)
            #sub Wifreme Method in PArent Wifeframe
            childInsertMember(childInnerTemplate=CHILD_WIFRAME_MODULE_METHOD_INNER_TEMPLATE,insertingModule=WIREFRAME, subType=1)
            #create sub Presneter File
            createSubModule(module=PRESENTER,subTemplateFile=CHILD_PRESENTER_TEMPLATE,subModuleFileName = sub_module + presenter_filename)
            #create sub Presneter File
            createSubModule(module=VIEW,subTemplateFile=CHILD_VIEW_TEMPLATE,subModuleFileName = sub_module + view_filename)
            #Parent Interecator define inner child module  Method
            #parent_module+Interacator.swift
            childInsertMember(childInnerTemplate=CHILD_INTERACTOR_PRESENTER_MODULE_FIELD_TEMPLATE,insertingModule=INTERACTOR, subType=0)
            childInsertMember(childInnerTemplate=CHILD_INTERACTOR_INNER_MODULE_TEMPLATE,insertingModule=INTERACTOR, subType=1)
        else:
            showErrorMessages(MESSAGE.ERROR,"viperize " + parent_module + " not found")
    elif intern(module_type) is intern(sub_module_type) and len(sys.argv) <> 4:
        showErrorMessages(MESSAGE.ERROR,"viperize -typeName -parentModuleName -subModule")
        showErrorMessages(MESSAGE.ERROR,"-subModule command has not found")
    else:
        showErrorMessages(MESSAGE.ERROR,"viperize -typeName -parentModuleName -subModule")
        showErrorMessages(MESSAGE.ERROR,"-typeName command is not correct")
        showErrorMessages(MESSAGE.ERROR,"for parent module is use to -p , for sub module is use to -s")

#os.system("rm -rf " + param)
#showErrorMessages(MESSAGE.SUCCESS,"child")
#os.path.isdir("/home/el")
#print type(protocol_file_content)
