#-------------------------------------------------------------------------------
# Name:        AspectPys
# Purpose:
#
# Author:      Felipe Desiglo
#
# Created:     23/05/2014
# Copyright:   (c) Desiglo 2014
#-------------------------------------------------------------------------------
##def After(*args):
##    pass
##
##def Before(result):
##    pass

def Nothing(*args):
    '''
        -The pure void
        Ps: This is a metaphisichs function
        his code is in the mind of the programmer
    '''
    pass

class point():
    def __init__(self,func, after=Nothing, before=Nothing):
        self.func =func
        self.after =after
        self.before =before
        #self.middle =middle

    def poincut(self, *args):
        self.after(*args)

        call = "self.func("
        first = 0
        for item in args:
            if ( first== 1):
                call = call+" ,"
            else:
                first= 1
            call = call+" "+str(item)
        call = call+" )"
        result = eval(call)

        self.before(result)
        return result
    pass

def set_pointcut(func, after=Nothing, before=Nothing, *args):
    return point(func, after, before).poincut

def soma(a,b):
    return a+b

def antes(*args):
    print args

def depois(result):
    print "The Resullt is: " + str( result)

def test(*args, **kwargs):
    print args
    print kwargs

def main():
    global soma
##    print soma(5,8)
##    soma = set_pointcut(soma)
##    print soma(5,8)
    soma  = set_pointcut(soma, antes, depois)
##    print soma(5,8)
##    soma  = set_pointcut(soma, antes, depois)
##    print soma(5,8)
    #print soma(b=8 ,a=5)
    #print soma(5, b=8)
    #test(b=45)
    #test(5, b=8)
    print soma( "5,4 ) (Print 'ola'")
    pass

if __name__ == '__main__':
    main()
