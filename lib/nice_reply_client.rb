require "nice_reply_client/version"
require "net/http"

class NiceReplyClient
  def initialize(credentials={})
    @api_key = credentials[:api_key]
  end

  # Thanks to the Gibbon gem https://github.com/amro/gibbon
  # for the idea to use method_missing and a call method
  def method_missing(method, *args)
    call(method,args)
  end

  private

  def call(method,args)
    response = http.request(compose_request(method,args[0]))
    response_hash = { code: response.code, body: response.body }
  end

  def convert_case(method_name)
    # Thanks to James Edward Gray II for the regex idea!
    # https://twitter.com/JEG2/status/358958848649863168
    method_name.gsub(/_([a-z])/) { |s| $1.upcase }
  end

  def compose_request(method,options)
    request = Net::HTTP::Post.new("#{core_url}#{convert_case(method.to_s)}")
    request.set_form_data(options_with_credentials(options))
    request
  end

  def options_with_credentials(options)
    options = Hash.new if options.nil?
    options[:apikey] = @api_key
    options
  end

  def core_url
    "http://www.nicereply.com/api/"
  end

  def http
    uri = URI.parse(core_url)
    Net::HTTP.new(uri.host,uri.port)
  end
end
