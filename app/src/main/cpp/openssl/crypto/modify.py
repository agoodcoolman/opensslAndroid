#-*-coding:utf-8-*-
# 把C文件里面的openssl的路径批量修改
import os, re, fileinput, stat

lists = []
def file_h_list(file_dir):
    global lists
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.h') :
                lists.append(file)
        for dir in dirs:
            file_h_list(os.path.join(root, dir))
    return list

def file_name(file_dir):
    global L;
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.h')| (os.path.splitext(file)[1] == '.c'):
                modify4(os.path.join(root, file))
        for dir in dirs:
            file_name(os.path.join(root, dir))

def modify4(file):
    global lists
    with open(file, 'r') as f:
        lines = f.readlines()
    #写的方式打开文件
    with open(file, 'w') as f_w:
        for line in lines:
            results = re.compile(r'#\s*include\s*[<|\"](.*)[<|\"]').findall(line)
            for result in results:
                if result in lists:

                    line = re.sub(r'#\s*include\s*([<|\"])', '# include \"../openssl/', line)
                    line.replace('>', '\"')
            f_w.write(line)

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
#
def modify3(file):
    with open(file, 'r') as f:
        lines = f.readlines()
    #写的方式打开文件
    with open(file, 'w') as f_w:
        for line in lines:
            results = re.compile(r'#\s*include\s*\"(.*)\"').findall(line)
            for result in results:

                if result in lists:
                    line = line.replace('<', '"../../openssl/').replace('>', '\"')
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

file_h_list(os.getcwd() + "/../openssl")
file_name(os.getcwd())
#modify4(os.getcwd() + "/bf/bf_cbc.c")
# 找到过滤出来最后一个.h文件的名字
#print re.compile(r'[^/]+(?!.*/)(?=>)').findall('#include <../openssl/bf_locl.h>')
# 这个是找到单独的opensll里面的引入的.h文件
#print re.compile(r'#\s*include\s*[<|\"](.*)[<|\"]').findall('#include \"../openssl/bf_locl.h\"')
#print re.sub(r'#\s*include\s*(<)', '\"', '#include <../openssl/bf_locl.h>')
#modify2('/root/桌面/opensslAndroid/app/src/main/cpp/openssl/crypto/asn1/n_pkey.c')