# -*- coding: utf-8 -*-   
      
import os
L = ''
index = 0
def file_name(file_dir):
    global L;
    global index;
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.c'):
                #print os.path.join(root, file)
                if (index > 10):
                    index = 0;
                    L += '==\r\n'
                L += os.path.join(root, file) + ' '
                index = index + 1


    return L

def file_name2(file_dir):
    global L;
    global index;
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.S'):
                #print os.path.join(root, file)
                if (index > 10):
                    index = 0;
                    L += '==\r\n'
                L += os.path.join(root, file) + ' '
                index = index + 1


    return L

print file_name2('./').replace('./', '').replace('\\', '/').replace('==', '\\')

