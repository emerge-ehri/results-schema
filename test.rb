require 'rubygems'
gem 'nokogiri'
require 'nokogiri'

def validate(document_path, schema_path)
  schema = Nokogiri::XML::Schema(File.read(schema_path))
  document = Nokogiri::XML(File.read(document_path))
  document.root.add_namespace_definition(nil, "")
  schema.validate(document)
end

validate('emerge-seq-example.xml', 'emerge-seq-schema.xsd').each do |error|
  puts "#{error.line}: #{error.message}"
end