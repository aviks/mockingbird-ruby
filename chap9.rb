require "test/unit"

module Chap9

	K = lambda { |x|
			return lambda{|y| return x;};
	};

	I = lambda { |x| return x;};

	M = lambda { |x| return x.call(x);};

end

class Chap9Tests < Test::Unit::TestCase

include Chap9;

	def test_birds
		#Two random birds
		a=lambda { |x|  return nil; };
		b=lambda { |x| return a };

		#Identity bird echoes whatever it is called with
		assert( I.call(a) == a );
		assert( I.call(b) == b );

		#Kestrel by definition
		assert( K.call(a).call(b) == a);

		#Mockingbird mimics its caller x as far as its response to x goes
		assert( M.call(a) == a.call(a));
		assert( M.call(b) == b.call(b));

	end 

end
