import os,sys


strfef=' '
def run(parent):
    global strfef
    currentPath = os.getcwd() + parent
    print currentPath
    paths = os.listdir(currentPath)

    for p in paths:
        if os.path.isfile(p) :
            if p.endswith('.c') | p.endswith('.h'):
                if parent != '':
                    strfef += parent + '/'+ p + ' '
                else:
                    strfef +=  p + ' '
        if os.path.isdir(p):
            if parent != '':
                print 'hhh', parent
                run(parent+ '/' + p);
                #print parent+ '/' + p
            else:
                run(p);
    #print strfef


run('');
