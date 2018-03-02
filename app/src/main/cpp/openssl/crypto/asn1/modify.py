#-*-coding:utf-8-*-
import os, re, fileinput, stat


def file_name(file_dir):
    global L;

    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.c'):
                modify2(file)



def modify2(file):

    with open(file, r'r') as f:
        lines = f.readlines()
    #写的方式打开文件
    with open(file, r'w') as f_w:
        for line in lines:
            if re.match(r'#include\s*(\<)openssl', line):
                            line = re.sub(r'#include\s*(\<)openssl', '#include \"../../openssl', line)
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

file_name(r'./')
#modify2('a_type.c')