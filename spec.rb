
require './parser.rb'

describe Parser do
  describe '#parse' do
    it 'returns an empty hash on empty input' do
      Parser.parse('').should == {}
    end
  end
end
