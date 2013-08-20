require 'spec_helper'

describe NiceReplyClient do
  let(:api_key) { "abc123" }

  let :nice_reply_client do
    NiceReplyClient.new(
      api_key: api_key
    )
  end

  context "calling the API" do
    let(:url) { "http://www.nicereply.com/api" }
    let(:user_id) { "1234" }

    it "calls the correct api method" do
      stub_request(:post, "http://www.nicereply.com/api/getUserAverage").
      to_return(:status => 200, :body => "", :headers => {})

      nice_reply_client.getUserAverage

      a_request(
        :post, "#{url}/getUserAverage"
      ).
      should have_been_made
    end

    it "includes the credentials"


    it "includes options"
  end
end
