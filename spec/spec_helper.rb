require 'readme_spec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.readme_file_path = File.dirname(__FILE__) + '/../README.md'
end

def load_md(file_name)
  File.read("#{File.dirname(__FILE__)}/fixtures/#{file_name}.md")
end
