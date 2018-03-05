#-*-coding:utf-8-*-
# 把C文件里面的openssl的路径批量修改
import os, re, fileinput, stat, shutil

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

def file_contain_h(file_dir):
    lists = []
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.h'):
                list.append(re.sub('.*openssl/', '', root))
                break
        for dir in dirs:
            file_contain_h(os.path.join(root, dir))
    return list

def file_h_move_openssl(file_dir, destdir):
    lists = []
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.h'):
                shutil.copy(os.path.join(root, file), destdir)


        for dir in dirs:
            file_h_move_openssl(os.path.join(root, dir), destdir)
    return list


#openssl =  file_name(os.getcwd() + "/openssl")
#deletefile_name(os.getcwd() + "/apps")
#deletefile_name(os.getcwd() + "/crypto")
#deletefile_name(os.getcwd() + "/ssl")
#print file_contain_h(os.getcwd())
file_h_move_openssl(os.getcwd(), os.getcwd() + "/openssl")