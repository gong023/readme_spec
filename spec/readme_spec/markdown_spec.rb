require 'spec_helper'

describe 'README' do
  it { expect { ReadmeSpec.evaluate(binding) }.not_to raise_error }
end

describe ReadmeSpec do
  subject { described_class }

  context 'HasValidRubyCode' do
    before(:context) do
      RSpec.configure do |c|
        c.readme_file_path = File.dirname(__FILE__) + '/../fixtures/HasValidRubyCode.md'
      end
    end
    it { expect { subject.evaluate(binding) }.not_to raise_error }
  end

  context 'HasInvalidRubyCode' do
    before(:context) do
      RSpec.configure do |c|
        c.readme_file_path = File.dirname(__FILE__) + '/../fixtures/HasInvalidRubyCode.md'
      end
    end

    let(:expected_message) do
<<'EOL'
expected #<Fixnum:3> => 1
     got #<Fixnum:7> => 3
EOL
    end

    it { expect { subject.evaluate(binding) }.to raise_error(/#{expected_message}/) }
  end

  describe ReadmeSpec::Markdown do
    context 'HasValidRubyCode' do
      subject { described_class.parse(load_md('HasValidRubyCode')) }

      context 'ruby_codes' do
        subject { described_class.parse(load_md('HasValidRubyCode')).ruby_codes }

        it 'returns only ruby code' do
          expect(subject.size).to be 1
        end

        it { expect(subject.first).to be_instance_of ReadmeSpec::Markdown::Code }
      end
    end
  end
end

