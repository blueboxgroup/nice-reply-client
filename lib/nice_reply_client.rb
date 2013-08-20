require "nice_reply_client/version"

class NiceReplyClient
  def initialize(credentials={})
    @api_key = credentials[:api_key]
  end

  def method_missing(method, *args)
    call(method)
  end

  private

  def call(method)
    http.request(compose_request(method))
  end

  def compose_request(method)
    request = Net::HTTP::Post.new("#{core_url}#{method}")
    request.set_form_data(apikey: @api_key)
    request
  end

  def core_url
    "http://www.nicereply.com/api/"
  end

  def http
    uri = URI.parse(core_url)
    Net::HTTP.new(uri.host,uri.port)
  end
end
