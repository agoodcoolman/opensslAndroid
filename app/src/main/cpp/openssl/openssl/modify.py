#-*-coding:utf-8-*-
# 把C文件里面的openssl的路径批量修改
import os, re, fileinput, stat

lists = []
def file_name(file_dir):
    print file_dir
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            print file
            if (os.path.splitext(file)[1] == '.h'):
                modify2(os.path.join(root, file))
        for dir in dirs:
            file_name(os.path.join(root, dir))



def modify2(file):
    with open(file, 'r') as f:
        lines = f.readlines()
    #写的方式打开文件
    with open(file, 'w') as f_w:
        for line in lines:
            results = re.compile(r'#\s*include\s*\<(.*)\>').findall(line)
            for result in results:
                print result, 'result'
                if result in lists:
                    line = line.replace('<', '\"').replace('>', '\"')
            f_w.write(line)

def file_h_list(file_dir):
    global lists
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.h'):
                lists.append(file)


        for dir in dirs:
            file_h_list(os.path.join(root, dir))
    return list

l = file_h_list(os.getcwd())
#print lists
#modify2(os.getcwd() + "/asn1.h")
file_name(os.getcwd())
#modify2('/root/桌面/opensslAndroid/app/src/main/cpp/openssl/crypto/asn1/n_pkey.c')