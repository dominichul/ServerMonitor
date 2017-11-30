##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Preview < Domain
      class Proxy < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ShortCodeList < ListResource
            ##
            # Initialize the ShortCodeList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [ShortCodeList] ShortCodeList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/ShortCodes"
            end

            ##
            # Retrieve a single page of ShortCodeInstance records from the API.
            # Request is executed immediately.
            # @param [String] sid The shortcode Sid that uniquely identifies this resource
            # @return [ShortCodeInstance] Newly created ShortCodeInstance
            def create(sid: nil)
              data = Twilio::Values.of({'Sid' => sid})

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ShortCodeInstance.new(@version, payload, service_sid: @solution[:service_sid])
            end

            ##
            # Lists ShortCodeInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams ShortCodeInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size])

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ShortCodeInstance records from the API.
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
            # Retrieve a single page of ShortCodeInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ShortCodeInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ShortCodePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ShortCodeInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ShortCodeInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ShortCodePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Proxy.ShortCodeList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ShortCodePage < Page
            ##
            # Initialize the ShortCodePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ShortCodePage] ShortCodePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ShortCodeInstance
            # @param [Hash] payload Payload response from the API
            # @return [ShortCodeInstance] ShortCodeInstance
            def get_instance(payload)
              ShortCodeInstance.new(@version, payload, service_sid: @solution[:service_sid])
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Proxy.ShortCodePage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ShortCodeContext < InstanceContext
            ##
            # Initialize the ShortCodeContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The shortcode Sid that uniquely identifies this resource
            # @return [ShortCodeContext] ShortCodeContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid}
              @uri = "/Services/#{@solution[:service_sid]}/ShortCodes/#{@solution[:sid]}"
            end

            ##
            # Deletes the ShortCodeInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a ShortCodeInstance
            # @return [ShortCodeInstance] Fetched ShortCodeInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ShortCodeInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid])
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Proxy.ShortCodeContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class ShortCodeInstance < InstanceResource
            ##
            # Initialize the ShortCodeInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Service.
            # @param [String] sid The shortcode Sid that uniquely identifies this resource
            # @return [ShortCodeInstance] ShortCodeInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'short_code' => payload['short_code'],
                  'country_code' => payload['country_code'],
                  'capabilities' => payload['capabilities'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid']}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ShortCodeContext] ShortCodeContext for this ShortCodeInstance
            def context
              unless @instance_context
                @instance_context = ShortCodeContext.new(@version, @params['service_sid'], @params['sid'])
              end
              @instance_context
            end

            ##
            # @return [String] A string that uniquely identifies this resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Service Sid.
            def service_sid
              @properties['service_sid']
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
            # @return [String] The short code. e.g., 894546.
            def short_code
              @properties['short_code']
            end

            ##
            # @return [String] The ISO 3166-1 alpha-2 country code
            def country_code
              @properties['country_code']
            end

            ##
            # @return [Hash] Indicate if a shortcode can receive messages
            def capabilities
              @properties['capabilities']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # Deletes the ShortCodeInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a ShortCodeInstance
            # @return [ShortCodeInstance] Fetched ShortCodeInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Proxy.ShortCodeInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Proxy.ShortCodeInstance #{values}>"
            end
          end
        end
      end
    end
  end
end