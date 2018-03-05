#-*-coding:utf-8-*-
# 把C文件里面的openssl的路径批量修改
import os, re, fileinput, stat

list = []
def file_name(file_dir):

    global list
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.h'):
                list.append(file)
    return list

def deletefile_name(file_dir):
    global list
    for root, dirs, files in os.walk(file_dir):
        for file in files:

            if (os.path.splitext(file)[1] == '.h'):
                if (file in list):
                    os.remove(os.path.join(root, file))
        for dir in dirs:
             deletefile_name(os.path.join(root, dir))

    return list

openssl =  file_name(os.getcwd() + "/openssl")
deletefile_name(os.getcwd() + "/apps")
deletefile_name(os.getcwd() + "/crypto")
deletefile_name(os.getcwd() + "/ssl")