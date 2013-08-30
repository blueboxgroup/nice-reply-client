# Nice::Reply::Client

This is a simple Ruby wrapper for the Nice Reply API.

## Installation

Add this line to your application's Gemfile:

    gem 'nice-reply-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nice-reply-client

## Usage

### Creating an instance of Nice Reply Client

<pre>
  nice_reply_client = NiceReplyClient.new(
                        api_key: [Your Nice Reply API Key]
                      )
</pre>

You can now call any method from Nice Reply's API.  You do need to provide the method name in snake_case format.  Please see blow for examples.

_For a complete list of API calls, please see Nice Reply's [API documentation](http://www.nicereply.com/API-example/doc/api-reference.html)

### Examples

Getting your company's average ratings score:
  <pre>
    nice_reply_client.get_company_average
    {"companyAverage": 10.0}
  </pre>

Getting your company's user list

Getting a user's average rating

Getting a user's average from last month

Setting a rating

Updating a rating
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
