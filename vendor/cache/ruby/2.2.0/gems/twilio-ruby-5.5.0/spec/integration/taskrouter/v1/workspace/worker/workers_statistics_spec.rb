##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'WorkersStatistics' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                           .workers \
                           .statistics().fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/Statistics',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "cumulative": {
              "reservations_created": 0,
              "reservations_accepted": 0,
              "reservations_rejected": 0,
              "reservations_timed_out": 0,
              "reservations_canceled": 0,
              "reservations_rescinded": 0,
              "activity_durations": [
                  {
                      "max": 0,
                      "min": 900,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "friendly_name": "Offline",
                      "avg": 1080,
                      "total": 5400
                  },
                  {
                      "max": 0,
                      "min": 900,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "friendly_name": "Busy",
                      "avg": 1012,
                      "total": 8100
                  },
                  {
                      "max": 0,
                      "min": 0,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "friendly_name": "Idle",
                      "avg": 0,
                      "total": 0
                  },
                  {
                      "max": 0,
                      "min": 0,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                      "friendly_name": "Reserved",
                      "avg": 0,
                      "total": 0
                  }
              ],
              "start_time": "2008-01-02T00:00:00Z",
              "end_time": "2008-01-02T00:00:00Z"
          },
          "realtime": {
              "total_workers": 15,
              "activity_statistics": [
                  {
                      "friendly_name": "Idle",
                      "workers": 0,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  },
                  {
                      "friendly_name": "Busy",
                      "workers": 9,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  },
                  {
                      "friendly_name": "Offline",
                      "workers": 6,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  },
                  {
                      "friendly_name": "Reserved",
                      "workers": 0,
                      "sid": "WAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
                  }
              ]
          },
          "workspace_sid": "WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "url": "https://taskrouter.twilio.com/v1/Workspaces/WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Workers/Statistics"
      }
      ]
    ))

    actual = @client.taskrouter.v1.workspaces("WSaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") \
                                  .workers \
                                  .statistics().fetch()

    expect(actual).to_not eq(nil)
  end
end