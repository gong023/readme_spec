require "readme_spec/version"

RSpec.configure do |config|
  config.add_setting :readme_file_path
end

module ReadmeSpec
  def self.evaluate
    config_path = Configure.new.load_path
    content = File.new(config_path).load_content
    Markdown.parse(content).ruby_codes.each { |c| c.evaluate }
  end

  class Configure
    def load_path
      validate
      file_path
    end

    def validate
      unless RSpec.configuration.readme_file_path?
        raise ReadmeSpecMissingFilePathError
      end
    end

    def file_path
      RSpec.configuration.readme_file_path
    end

    class ReadmeSpecMissingFilePathError < Exception; end
  end

  class File
    def initialize(path)
      @path = path
    end

    def load_content
      validate
      content
    end

    def validate
      unless ::File.file?(@path)
        raise ReadmeSpecInvalidFileError, @path
      end
    end

    def content
      ::File.read(@path)
    end

    class ReadmeSpecInvalidFileError < Exception; end
  end

  class Markdown
    def self.parse(content)
      parser = Qiita::Markdown::Processor.new
      self.new(parser.call(content))
    end

    def initialize(text)
      @text = text
    end

    def ruby_codes
      codes = @text.inject([]) { |codes, text| codes << Code.new(text) }
      codes.select { |c| c.language === 'ruby' }
    end

    class Code
      def initialize(pre_text)
        @pre_text = pre_text
      end

      def evaluate
        eval(@pre_text[:code])
      end

      def language
        @pre_text[:language]
      end
    end
  end
end
