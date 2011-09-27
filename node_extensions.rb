module KeyValue
  class OptionList < Treetop::Runtime::SyntaxNode
    def to_hash
    	return {} if terminal?
      { key.to_sym => value.to_value }
    end
  end
  
  class Key < Treetop::Runtime::SyntaxNode
  	def to_sym
  		text_value.to_sym
  	end
  end

  class Value < Treetop::Runtime::SyntaxNode
  	def to_value
  		elements[0].to_value
  	end
  end

  class FloatLiteral < Treetop::Runtime::SyntaxNode
  	def to_value
  		text_value.to_f
  	end
  end

  class IntegerLiteral < Treetop::Runtime::SyntaxNode
  	def to_value
  		text_value.to_i
  	end
  end

  class StringLiteral < Treetop::Runtime::SyntaxNode
  	def to_value
  		text_value.to_s
  	end
  end
end