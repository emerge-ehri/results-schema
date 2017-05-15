require 'rubygems'
gem 'nokogiri'
require 'nokogiri'

def validate(document_path, schema_path)
  schema = Nokogiri::XML::Schema(File.read(schema_path))
  document = Nokogiri::XML(File.read(document_path))
  document.root.add_namespace_definition(nil, "http://emerge.mc.vanderbilt.edu/")
  schema.validate(document)
end

Dir.glob('./data/*.xml') do |item|
  next if item == '.' or item == '..'
  # do work on real items
  validate(item, 'emerge-seq-schema.xsd').each do |error|
    puts "#{error.line}: #{error.message}"
  end

end

