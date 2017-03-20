import DebugUtil

@DebugUtil.Debug
def TestMethod(a,b):
	print a
	print b
	pass

TestMethod(1,2)

DebugUtil.t_debug = True
TestMethod(1,2)