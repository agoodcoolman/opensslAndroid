#-*-coding:utf-8-*-
# 把C文件里面的openssl的路径批量修改
import os, re, fileinput, stat


def file_name(file_dir):
    global L;

    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.c'):

                modify2(os.path.join(root, file))
        for dir in dirs:
            file_name(os.path.join(root, dir))



def modify2(file):

    with open(file, 'r') as f:
        lines = f.readlines()
    #写的方式打开文件
    with open(file, r'w') as f_w:
        for line in lines:
            if re.match(r'#\s*include\s*(\<).*openssl', line):
                            line = re.sub('#\s*include\s*(\<).*openssl', '\"', line)
                            line = line.replace('>', '\"')

            f_w.write(line)

def modify(file):
    file_object1 = open(file, 'r+')

    global line
    try:
      while True:
          line = file_object1.readline()
          print line
          break
          if line:
             if re.match(r'#include\s*(\<)openssl', line):
                line = re.sub(r'#include\s*(\<)openssl', '\"../../openssl', line)
                line = line.replace('>', '\"')
                file_object1.seek(0, 1)
                file_object1.write(line)
          else:
             break
    finally:
        file_object1.close()

file_name(os.getcwd())
#modify2('/root/桌面/opensslAndroid/app/src/main/cpp/openssl/crypto/asn1/n_pkey.c')