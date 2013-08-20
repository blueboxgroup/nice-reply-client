require "nice_reply_client/version"

class NiceReplyClient
  def initialize(credentials={})
    @user_name = credentials[:user_name]
    @api_key = credentials[:api_key]
  end

  def method_missing(method, *args)
    compose_url(method,args)
  end

  private

  def core_url
    "http://www.nicereply.com/api/"
  end

  def credentials
    "apikey=#{@api_key}"
  end

  def add_options(args)
    options_string = ""

    args.each do |a|
      a.each do |k,v|
       options_string += "&#{k}=#{v}"
      end
    end

    options_string
  end

  def compose_url(method,args)
    add_options(args)
    "#{core_url}#{method}?#{credentials}#{add_options(args)}"
  end
end
