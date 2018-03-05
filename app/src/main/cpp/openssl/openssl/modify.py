#-*-coding:utf-8-*-
# 把C文件里面的openssl的路径批量修改
import os, re, fileinput, stat


def file_name(file_dir):
    global L;

    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.h'):
                modify2(os.path.join(root, file))
        for dir in dirs:
            file_name(os.path.join(root, dir))



def modify2(file):
    with open(file, 'r') as f:
        lines = f.readlines()
    #写的方式打开文件
    with open(file, r'w') as f_w:
        for line in lines:
            if re.match(r'#\s*include\s*[\<|\"].*openssl', line):
                    line = re.sub(r'[\<|\"].*/?openssl/', '\"', line)
                    line = line.replace('>', '\"')

            f_w.write(line)



file_name(os.getcwd())
#modify2('/root/桌面/opensslAndroid/app/src/main/cpp/openssl/crypto/asn1/n_pkey.c')