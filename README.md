# Wikipettan

You can get member names of Wikipedia Category.
this use MediaWiki API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wikipettan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wikipettan

## Usage

### build category instance

from category title
```ruby
category = Wikipettan.category(title: "日本の女性声優")
```

from category pageid
```ruby
category = Wikipettan.category(pageid: 676880)
```

### request to MediaWiki API

```ruby
category.all_request!
```

### get category_members

```ruby
category.members.each do |member|
  puts "pageid: #{member.pageid}, title: #{member.title}"
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wikipettan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

