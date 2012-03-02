require "test/unit"


module Chap9

	include Kernel

	#Composition
	Compose = lambda {| x, y| 
		return lambda {|z| 			
			x.call(y.call(z))}
	}	

	#The Mocking bird
	M = lambda { |x| return x.call(x)}

	#The Kestrel
	K = lambda { |x|
			return lambda{|y| return x}
	}

	#The Identity bird
	I = lambda { |x| return x}

	

end

class Chap9Tests < Test::Unit::TestCase

include Chap9;

	def test_birds
		#Two random birds
		a=lambda { |x|  return nil }
		b=lambda { |x| return a }

		#Identity bird echoes whatever it is called with
		assert( I.call(a) == a )
		assert( I.call(b) == b )

		#Kestrel by definition
		assert( K.call(a).call(b) == a)
		assert( K.call(b).call(a) == b)

		#Mockingbird mimics its caller x as far as its response to x goes
		assert( M.call(a) == a.call(a))
		assert( M.call(b) == b.call(b))


		#6.1 If M and Compose condition exists, then every bird is fond of at least one bird. 
		# ie, fixed point combinators exist. 
		#The following code is structured on that proof, but throws a 'too deep stack' error
		#Due to the self reference, this needs lazy evaluation to work. 
		# c = Compose.call( b , M)		
		# cc = c.call(c)
		# #b is fond of CC
		# assert ( b.call(cc) == cc )
	end 

end
