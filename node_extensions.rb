module KeyValue
  class OptionList < Treetop::Runtime::SyntaxNode
    def to_hash
      hash = {}
      self.elements.each do |option|
        hash.merge!(option.to_hash)
      end
      hash
    end
  end

  class Option < Treetop::Runtime::SyntaxNode
    def to_hash
      return {key.to_sym => value.to_value}
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
  		return eval text_value
  	end
  end
end
