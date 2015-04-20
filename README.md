# ReadmeSpec

Test your spec in README

## Usage

Set you readme file absolute path.

```
# spec_helper.rb
RSpec.configure do |c|
  c.readme_file_path = File.dirname(__FILE__) + '/../README.md'
end
```

Write spec in README.

<pre>
Your awesome description.

Your sample code.

```ruby
class YourClass
  def do_something
    true
  end
end

your_class = YourClass.new
expect(your_class.do_something).to be_true
```
</pre>

Call `ReadmeSpec.evaluate` in your test code.

```
expect { ReadmeSpec.evaluate(binding) }.not_to raise_error
```

`Readme.evaluate` evals your code in README sorrounded by `ruby`.

In this case, `expect(your_class.do_something).to be_true` works in your test code.

## Contributing

1. Fork it ( https://github.com/gong023/readme_spec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
