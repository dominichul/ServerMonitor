##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Participant' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                      .participants("PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "room_sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "start_time": "2015-07-30T20:00:00Z",
          "end_time": null,
          "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "bob",
          "status": "connected",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "duration": null,
          "links": {
              "published_tracks": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .participants("PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                      .participants.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "participants": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "participants"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .participants.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_filters responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "participants": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "room_sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2017-07-30T20:00:00Z",
                  "date_updated": "2017-07-30T20:00:00Z",
                  "start_time": "2017-07-30T20:00:00Z",
                  "end_time": "2017-07-30T20:00:01Z",
                  "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "identity": "alice",
                  "status": "disconnected",
                  "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "duration": 1,
                  "links": {
                      "published_tracks": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "participants"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .participants.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                      .participants("PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "room_sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2017-07-30T20:00:00Z",
          "date_updated": "2017-07-30T20:00:00Z",
          "start_time": "2017-07-30T20:00:00Z",
          "end_time": "2017-07-30T20:00:01Z",
          "sid": "PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "identity": "alice",
          "status": "disconnected",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "duration": 1,
          "links": {
              "published_tracks": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PublishedTracks"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                             .participants("PAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update()

    expect(actual).to_not eq(nil)
  end
end