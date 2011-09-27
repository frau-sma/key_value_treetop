require './parser.rb'

describe Parser do
  describe '#parse' do
    it 'returns an empty hash on empty input' do
      Parser.parse('').should == {}
    end
    
    it 'returns a hash with the key pointing at an integer when input is key=<integer>' do
      Parser.parse('foo=2').should == { :foo => 2 }
    end
    
    it 'returns a hash with the key pointing at an integer when input is key=-<integer>' do
      Parser.parse('foo=-191').should == { :foo => -191 }
    end
    
    it 'returns a hash with the key pointing at a float when input is key=<float>' do
      Parser.parse('bar=1.3').should == { :bar => 1.3 }
    end
    
    it 'returns a hash with the key pointing at a string when input is key="<string>"' do
      Parser.parse('baz="quux"').should == { :baz => 'quux' }
    end

    it 'returns a hash with the key pointing at a string when input is key="<string>", containing spaces' do
      Parser.parse('baz="quux quuux quuuux"').should == { :baz => 'quux quuux quuuux' }
    end

    it 'allows spaces before the key' do
      Parser.parse('    foo=1').should == {:foo => 1}
    end

    it 'allows spaces after the key' do
      Parser.parse('foo       =1').should == {:foo => 1}
    end

    it 'allows spaces before the value' do
      Parser.parse('foo=   1').should == {:foo => 1}
    end

    it 'allows spaces after the value' do
      Parser.parse('foo=1        ').should == {:foo => 1}
    end

    it 'allows spaces everywhere!' do
      Parser.parse(' foo = "my new string" ').should == {:foo => 'my new string'}
    end

    it 'raises an exception when input is key=<string> without quotes' do
      expect {Parser.parse('quuux=quuuux')}.should raise_exception
    end

    it 'returns a hash containing two items for input that contains two items' do
      Parser.parse("foo = 1.9\nbar = 77.4").should == {:foo => 1.9, :bar => 77.4}
    end
  end
end
