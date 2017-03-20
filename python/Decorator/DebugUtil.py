t_debug =False

class Debug(object):
	def __init__(self,f):
		self.f = f
		pass
	def __call__(self, *args):
		if t_debug:
			print "#debug..."+self.f.__name__
			print "parameters...:"
			ps = self.f.__code__.co_varnames
			c  = 0
			for p in ps:
				print p + ":" + (str)(args[c])
				c=c+1
			pass
			print "#Start Method#"
			self.f(*args)
			print "#End Method#"
		else:
			self.f(*args)
		pass
	pass

#@Debug
#def TestMethod(a,b):
#	print a
#	print b
#	pass

#t_debug = True
#TestMethod(1,2)
	
