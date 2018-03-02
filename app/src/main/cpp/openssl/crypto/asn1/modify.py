import os,re



def file_name(file_dir):
    global L;

    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if (os.path.splitext(file)[1] == '.c'):
                #print os.path.join(root, file)
                # L +=  os.path.join(root, file) + '  ==\r\n'
                modify(file)

def modify(file):
    with open(file, "r+") as f1:
        for line in f1:
            if line.startswith('#include'):
                print re.sub("^#include\s*(\<)openssl$\.h\>", '../../', line )



file_name('./')