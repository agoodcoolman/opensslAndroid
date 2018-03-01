# -*- coding: utf-8 -*-
      
import os
L = ''
index = 0
def file_name(file_dir):
    global L;

    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.c'):
                #print os.path.join(root, file)
                L += os.path.join(root, file) + '==\r\n'
    return L



print file_name('./').replace('./', '').replace('\\', '/').replace('==', '\\')