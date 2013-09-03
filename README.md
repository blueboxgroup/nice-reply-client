# Nice Reply Client

This is a simple Ruby wrapper for the [Nice Reply](http://www.nicereply.com/) API.

## Requirements

* A [Nice Reply](http://www.nicereply.com/) Account
* The account's private API key

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
                        api_key: [Your Nice Reply Private API Key]
                      )
</pre>

You can now call any method from Nice Reply's API.  You do need to provide the method name in snake_case format.  Please see below for examples.

After each call, the gem will return a hash including the response code and the response body from CDNetworks.

For a complete list of API calls, please see Nice Reply's [API documentation](http://www.nicereply.com/API-example/doc/api-reference.html)

### Examples

Getting your company's average ratings score:
<pre>
  nice_reply_client.get_company_average
  => {:code=>"200", :body=>"{\"companyAverage\":9}"}
</pre>

Getting your company's user list
<pre>
  nice_reply_client.get_user_list

</pre>

Getting an agent's average rating
<pre>
  nice_reply_client.get_user_average(
    username: [Username to get average rating on]
  )
</pre>

Getting a agent's average rating from last month
<pre>
  nice_reply_client.get_user_average_last_month(
    username: [agent's username]
  )
</pre>

Setting a rating
<pre>
  nice_reply_client.set_rating(
    username: [agent's username],
    score: 10,
    from: [person leaving rating],
    ticket: "A123",
    comment: "Great service!"
  )
</pre>

Updating a rating
<pre>
  nice_reply_client.update_rating(
    id: [id # of rating to update],
    score: 7,
    comment: "OK service"
  )
</pre>
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Run specs with <pre>rake</pre>
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
