require 'spec_helper'

describe NiceReplyClient do
  let(:api_key) { "abc123" }

  let :nice_reply_client do
    NiceReplyClient.new(
      api_key: api_key
    )
  end

  context "calling the API" do
    let(:url) { "http://www.nicereply.com/api/" }
    let(:user_id) { "1234" }

    before(:each) do
      stub_request(
        :post,
        "#{url}getUserAverage"
      ).
     to_return(:status => 200, :body => "", :headers => {})
    end

    it "calls the correct api method" do
      nice_reply_client.getUserAverage

      a_request(:post, "#{url}getUserAverage").
        should have_been_made
    end

    it "includes the credentials" do
      nice_reply_client.getUserAverage

      a_request(:post, "#{url}getUserAverage").
        with(body: "apikey=#{api_key}").
        should have_been_made
    end

    it "includes options" do
      nice_reply_client.getUserAverage(userid: "#{user_id}")

      a_request(:post, "#{url}getUserAverage").
        with(body: "userid=#{user_id}&apikey=#{api_key}").
        should have_been_made
    end
  end
end
