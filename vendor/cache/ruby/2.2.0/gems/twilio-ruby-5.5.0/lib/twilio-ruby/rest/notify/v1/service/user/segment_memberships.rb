##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Notify < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class UserContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SegmentMembershipList < ListResource
              ##
              # Initialize the SegmentMembershipList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] identity The identity
              # @return [SegmentMembershipList] SegmentMembershipList
              def initialize(version, service_sid: nil, identity: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, identity: identity}
                @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:identity]}/SegmentMemberships"
              end

              ##
              # Retrieve a single page of SegmentMembershipInstance records from the API.
              # Request is executed immediately.
              # @param [String] segment The segment
              # @return [SegmentMembershipInstance] Newly created SegmentMembershipInstance
              def create(segment: nil)
                data = Twilio::Values.of({'Segment' => segment})

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                SegmentMembershipInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Notify.V1.SegmentMembershipList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SegmentMembershipPage < Page
              ##
              # Initialize the SegmentMembershipPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [SegmentMembershipPage] SegmentMembershipPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of SegmentMembershipInstance
              # @param [Hash] payload Payload response from the API
              # @return [SegmentMembershipInstance] SegmentMembershipInstance
              def get_instance(payload)
                SegmentMembershipInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Notify.V1.SegmentMembershipPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SegmentMembershipContext < InstanceContext
              ##
              # Initialize the SegmentMembershipContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The service_sid
              # @param [String] identity The identity
              # @param [String] segment The segment
              # @return [SegmentMembershipContext] SegmentMembershipContext
              def initialize(version, service_sid, identity, segment)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, identity: identity, segment: segment}
                @uri = "/Services/#{@solution[:service_sid]}/Users/#{@solution[:identity]}/SegmentMemberships/#{@solution[:segment]}"
              end

              ##
              # Deletes the SegmentMembershipInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Fetch a SegmentMembershipInstance
              # @return [SegmentMembershipInstance] Fetched SegmentMembershipInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                SegmentMembershipInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                    segment: @solution[:segment],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Notify.V1.SegmentMembershipContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
            class SegmentMembershipInstance < InstanceResource
              ##
              # Initialize the SegmentMembershipInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The service_sid
              # @param [String] identity The identity
              # @param [String] segment The segment
              # @return [SegmentMembershipInstance] SegmentMembershipInstance
              def initialize(version, payload, service_sid: nil, identity: nil, segment: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'identity' => payload['identity'],
                    'segment' => payload['segment'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'identity' => identity,
                    'segment' => segment || @properties['segment'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [SegmentMembershipContext] SegmentMembershipContext for this SegmentMembershipInstance
              def context
                unless @instance_context
                  @instance_context = SegmentMembershipContext.new(
                      @version,
                      @params['service_sid'],
                      @params['identity'],
                      @params['segment'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The account_sid
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The service_sid
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] The identity
              def identity
                @properties['identity']
              end

              ##
              # @return [String] The segment
              def segment
                @properties['segment']
              end

              ##
              # @return [String] The url
              def url
                @properties['url']
              end

              ##
              # Deletes the SegmentMembershipInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Fetch a SegmentMembershipInstance
              # @return [SegmentMembershipInstance] Fetched SegmentMembershipInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Notify.V1.SegmentMembershipInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Notify.V1.SegmentMembershipInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end