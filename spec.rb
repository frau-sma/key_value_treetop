require './parser.rb'

describe Parser do
  describe '#parse' do
    it 'returns an empty hash on empty input' do
      Parser.parse('').should == {}
    end
    
    it 'returns a hash with the key pointing at an integer when input is "key=<integer>"' do
    	Parser.parse('foo=2').should == { :foo => 2 }
    end
    
    it 'returns a hash with the key pointing at a float when input is "key=<float>"' do
    	Parser.parse('bar=1.3').should == { :bar => 1.3 }
    end
    
    it 'returns a hash with the key pointing at a string when input is "key=<string>"' do
    	Parser.parse('baz=quux').should == { :baz => 'quux' }
    end
  end
end
