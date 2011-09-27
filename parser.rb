require 'treetop'

BASE_PATH = File.expand_path(File.dirname(__FILE__)).freeze

require File.join(BASE_PATH, 'node_extensions.rb')

class Parser

  Treetop.load(File.join(BASE_PATH, 'key_value_parser.treetop'))
  @@parser = KeyValueParser.new

  def self.parse(data)
    tree = @@parser.parse(data)

    if(tree.nil?)
      raise Exception, "Parse error #{@@parser.failure_reason} at offset: #{@@parser.index}."
    end

    return tree.to_hash
  end
end
