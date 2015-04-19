# ReadmeSpec

Test your spec in README

## Usage

Set you readme file absolute path.

```ruby
RSpec.configure do |c|
  c.readme_file_path File.absolute_path('../README.md')
end
```

Write spec in README.

<pre>
Your awesome description.

Your sample code.

```ruby
your_class = YourClass.new
expect(your_class.do_something).to be_true
```
</pre>

Call `ReadmeSpec.evaluate` in your test code.

```ruby
expect { ReadmeSpec.evaluate }.not_to raise_error
```

`Readme.evaluate` evals your code in README sorrounded by `ruby`.

In this case, `expect(your_class.do_something).to be_true` works in your test code.

## Contributing

1. Fork it ( https://github.com/gong023/readme_spec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
