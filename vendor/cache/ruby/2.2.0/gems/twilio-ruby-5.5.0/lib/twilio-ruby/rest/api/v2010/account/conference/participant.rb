##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class ConferenceContext < InstanceContext
            class ParticipantList < ListResource
              ##
              # Initialize the ParticipantList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the Account that created this
              #   conference
              # @param [String] conference_sid A 34 character string that identifies the
              #   conference this participant is in
              # @return [ParticipantList] ParticipantList
              def initialize(version, account_sid: nil, conference_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, conference_sid: conference_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Participants.json"
              end

              ##
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [String] from The from
              # @param [String] to The to
              # @param [String] status_callback The status_callback
              # @param [String] status_callback_method The status_callback_method
              # @param [String] status_callback_event The status_callback_event
              # @param [String] timeout The timeout
              # @param [Boolean] record The record
              # @param [Boolean] muted The muted
              # @param [String] beep The beep
              # @param [Boolean] start_conference_on_enter The start_conference_on_enter
              # @param [Boolean] end_conference_on_exit The end_conference_on_exit
              # @param [String] wait_url The wait_url
              # @param [String] wait_method The wait_method
              # @param [Boolean] early_media The early_media
              # @param [String] max_participants The max_participants
              # @param [String] conference_record The conference_record
              # @param [String] conference_trim The conference_trim
              # @param [String] conference_status_callback The conference_status_callback
              # @param [String] conference_status_callback_method The
              #   conference_status_callback_method
              # @param [String] conference_status_callback_event The
              #   conference_status_callback_event
              # @param [String] recording_channels The recording_channels
              # @param [String] recording_status_callback The recording_status_callback
              # @param [String] recording_status_callback_method The
              #   recording_status_callback_method
              # @param [String] sip_auth_username The sip_auth_username
              # @param [String] sip_auth_password The sip_auth_password
              # @param [String] region The region
              # @param [String] conference_recording_status_callback The
              #   conference_recording_status_callback
              # @param [String] conference_recording_status_callback_method The
              #   conference_recording_status_callback_method
              # @return [ParticipantInstance] Newly created ParticipantInstance
              def create(from: nil, to: nil, status_callback: :unset, status_callback_method: :unset, status_callback_event: :unset, timeout: :unset, record: :unset, muted: :unset, beep: :unset, start_conference_on_enter: :unset, end_conference_on_exit: :unset, wait_url: :unset, wait_method: :unset, early_media: :unset, max_participants: :unset, conference_record: :unset, conference_trim: :unset, conference_status_callback: :unset, conference_status_callback_method: :unset, conference_status_callback_event: :unset, recording_channels: :unset, recording_status_callback: :unset, recording_status_callback_method: :unset, sip_auth_username: :unset, sip_auth_password: :unset, region: :unset, conference_recording_status_callback: :unset, conference_recording_status_callback_method: :unset)
                data = Twilio::Values.of({
                    'From' => from,
                    'To' => to,
                    'StatusCallback' => status_callback,
                    'StatusCallbackMethod' => status_callback_method,
                    'StatusCallbackEvent' => Twilio.serialize_list(status_callback_event) { |e| e },
                    'Timeout' => timeout,
                    'Record' => record,
                    'Muted' => muted,
                    'Beep' => beep,
                    'StartConferenceOnEnter' => start_conference_on_enter,
                    'EndConferenceOnExit' => end_conference_on_exit,
                    'WaitUrl' => wait_url,
                    'WaitMethod' => wait_method,
                    'EarlyMedia' => early_media,
                    'MaxParticipants' => max_participants,
                    'ConferenceRecord' => conference_record,
                    'ConferenceTrim' => conference_trim,
                    'ConferenceStatusCallback' => conference_status_callback,
                    'ConferenceStatusCallbackMethod' => conference_status_callback_method,
                    'ConferenceStatusCallbackEvent' => Twilio.serialize_list(conference_status_callback_event) { |e| e },
                    'RecordingChannels' => recording_channels,
                    'RecordingStatusCallback' => recording_status_callback,
                    'RecordingStatusCallbackMethod' => recording_status_callback_method,
                    'SipAuthUsername' => sip_auth_username,
                    'SipAuthPassword' => sip_auth_password,
                    'Region' => region,
                    'ConferenceRecordingStatusCallback' => conference_recording_status_callback,
                    'ConferenceRecordingStatusCallbackMethod' => conference_recording_status_callback_method,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                )
              end

              ##
              # Lists ParticipantInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Boolean] muted Only show participants that are muted or unmuted
              # @param [Boolean] hold The hold
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(muted: :unset, hold: :unset, limit: nil, page_size: nil)
                self.stream(muted: muted, hold: hold, limit: limit, page_size: page_size).entries
              end

              ##
              # Streams ParticipantInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Boolean] muted Only show participants that are muted or unmuted
              # @param [Boolean] hold The hold
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(muted: :unset, hold: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(muted: muted, hold: hold, page_size: limits[:page_size])

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields ParticipantInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size])

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [Boolean] muted Only show participants that are muted or unmuted
              # @param [Boolean] hold The hold
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of ParticipantInstance
              def page(muted: :unset, hold: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Muted' => muted,
                    'Hold' => hold,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                ParticipantPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of ParticipantInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of ParticipantInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                ParticipantPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.ParticipantList>'
              end
            end

            class ParticipantPage < Page
              ##
              # Initialize the ParticipantPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [ParticipantPage] ParticipantPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of ParticipantInstance
              # @param [Hash] payload Payload response from the API
              # @return [ParticipantInstance] ParticipantInstance
              def get_instance(payload)
                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.ParticipantPage>'
              end
            end

            class ParticipantContext < InstanceContext
              ##
              # Initialize the ParticipantContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] conference_sid The string that uniquely identifies the
              #   conference this participant is in
              # @param [String] call_sid The call_sid
              # @return [ParticipantContext] ParticipantContext
              def initialize(version, account_sid, conference_sid, call_sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, conference_sid: conference_sid, call_sid: call_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Conferences/#{@solution[:conference_sid]}/Participants/#{@solution[:call_sid]}.json"
              end

              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Update the ParticipantInstance
              # @param [Boolean] muted Indicates if the participant should be muted
              # @param [Boolean] hold The hold
              # @param [String] hold_url The hold_url
              # @param [String] hold_method The hold_method
              # @param [String] announce_url The announce_url
              # @param [String] announce_method The announce_method
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(muted: :unset, hold: :unset, hold_url: :unset, hold_method: :unset, announce_url: :unset, announce_method: :unset)
                data = Twilio::Values.of({
                    'Muted' => muted,
                    'Hold' => hold,
                    'HoldUrl' => hold_url,
                    'HoldMethod' => hold_method,
                    'AnnounceUrl' => announce_url,
                    'AnnounceMethod' => announce_method,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                ParticipantInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    conference_sid: @solution[:conference_sid],
                    call_sid: @solution[:call_sid],
                )
              end

              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.ParticipantContext #{context}>"
              end
            end

            class ParticipantInstance < InstanceResource
              ##
              # Initialize the ParticipantInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the Account that created this
              #   conference
              # @param [String] conference_sid A 34 character string that identifies the
              #   conference this participant is in
              # @param [String] call_sid The call_sid
              # @return [ParticipantInstance] ParticipantInstance
              def initialize(version, payload, account_sid: nil, conference_sid: nil, call_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'call_sid' => payload['call_sid'],
                    'conference_sid' => payload['conference_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'end_conference_on_exit' => payload['end_conference_on_exit'],
                    'muted' => payload['muted'],
                    'hold' => payload['hold'],
                    'start_conference_on_enter' => payload['start_conference_on_enter'],
                    'status' => payload['status'],
                    'uri' => payload['uri'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'conference_sid' => conference_sid,
                    'call_sid' => call_sid || @properties['call_sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [ParticipantContext] ParticipantContext for this ParticipantInstance
              def context
                unless @instance_context
                  @instance_context = ParticipantContext.new(
                      @version,
                      @params['account_sid'],
                      @params['conference_sid'],
                      @params['call_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The unique sid that identifies this account
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] A string that uniquely identifies this call
              def call_sid
                @properties['call_sid']
              end

              ##
              # @return [String] A string that uniquely identifies this conference
              def conference_sid
                @properties['conference_sid']
              end

              ##
              # @return [Time] The date this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [Boolean] Indicates if the endConferenceOnExit was set
              def end_conference_on_exit
                @properties['end_conference_on_exit']
              end

              ##
              # @return [Boolean] Indicates if the participant is muted
              def muted
                @properties['muted']
              end

              ##
              # @return [Boolean] The hold
              def hold
                @properties['hold']
              end

              ##
              # @return [Boolean] Indicates if the startConferenceOnEnter attribute was set
              def start_conference_on_enter
                @properties['start_conference_on_enter']
              end

              ##
              # @return [participant.Status] The status
              def status
                @properties['status']
              end

              ##
              # @return [String] The URI for this resource
              def uri
                @properties['uri']
              end

              ##
              # Fetch a ParticipantInstance
              # @return [ParticipantInstance] Fetched ParticipantInstance
              def fetch
                context.fetch
              end

              ##
              # Update the ParticipantInstance
              # @param [Boolean] muted Indicates if the participant should be muted
              # @param [Boolean] hold The hold
              # @param [String] hold_url The hold_url
              # @param [String] hold_method The hold_method
              # @param [String] announce_url The announce_url
              # @param [String] announce_method The announce_method
              # @return [ParticipantInstance] Updated ParticipantInstance
              def update(muted: :unset, hold: :unset, hold_url: :unset, hold_method: :unset, announce_url: :unset, announce_method: :unset)
                context.update(
                    muted: muted,
                    hold: hold,
                    hold_url: hold_url,
                    hold_method: hold_method,
                    announce_url: announce_url,
                    announce_method: announce_method,
                )
              end

              ##
              # Deletes the ParticipantInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.ParticipantInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.ParticipantInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end