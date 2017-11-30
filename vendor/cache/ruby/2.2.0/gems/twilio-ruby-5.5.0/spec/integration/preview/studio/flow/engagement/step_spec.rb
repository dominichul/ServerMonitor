##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Step' do
  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.studio.flows("FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .engagements("FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .steps.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Studio/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Engagements/FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Steps',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "previous_page_url": null,
              "next_page_url": null,
              "url": "https://preview.twilio.com/Studio/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Engagements/FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Steps?PageSize=50&Page=0",
              "page": 0,
              "first_page_url": "https://preview.twilio.com/Studio/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Engagements/FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Steps?PageSize=50&Page=0",
              "page_size": 50,
              "key": "steps"
          },
          "steps": []
      }
      ]
    ))

    actual = @client.preview.studio.flows("FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                   .engagements("FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                   .steps.list()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.preview.studio.flows("FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .engagements("FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                            .steps("FTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://preview.twilio.com/Studio/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Engagements/FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Steps/FTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "FTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "flow_sid": "FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "engagement_sid": "FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "name": "incomingRequest",
          "context": {},
          "transitioned_from": "Trigger",
          "transitioned_to": "Ended",
          "date_created": "2017-11-06T12:00:00Z",
          "date_updated": null,
          "url": "https://preview.twilio.com/Studio/Flows/FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Engagements/FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Steps/FTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      }
      ]
    ))

    actual = @client.preview.studio.flows("FWaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                   .engagements("FNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                   .steps("FTaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end
end