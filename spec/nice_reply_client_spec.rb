require 'spec_helper'

describe NiceReplyClient do
  let(:user_name) { "user@something.com" }
  let(:api_key) { "abc123" }

  let :nice_reply_client do
    NiceReplyClient.new(
      api_key: api_key
    )
  end

  context "forming a url" do
    it "adds the core url" do
      nice_reply_client.getUserAverage.should include("http://www.nicereply.com/api/")
    end

    it "adds the credentials" do
      nice_reply_client.getUserAverage.should include("apikey=#{api_key}")
    end

    it "adds the method name" do
      nice_reply_client.getUserAverage.should include("getUserAverage")
    end

    it "adds the options" do
      nice_reply_client.getUserAverage(userid: 1234).should include("userid=1234")
    end
  end
end
