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
          class AuthorizedConnectAppList < ListResource
            ##
            # Initialize the AuthorizedConnectAppList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique id of the SubAccount this Connect App has
            #   access to.
            # @return [AuthorizedConnectAppList] AuthorizedConnectAppList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/AuthorizedConnectApps.json"
            end

            ##
            # Lists AuthorizedConnectAppInstance records from the API as a list.
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
            # Streams AuthorizedConnectAppInstance records from the API as an Enumerable.
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
            # When passed a block, yields AuthorizedConnectAppInstance records from the API.
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
            # Retrieve a single page of AuthorizedConnectAppInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of AuthorizedConnectAppInstance
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
              AuthorizedConnectAppPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of AuthorizedConnectAppInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of AuthorizedConnectAppInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              AuthorizedConnectAppPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.AuthorizedConnectAppList>'
            end
          end

          class AuthorizedConnectAppPage < Page
            ##
            # Initialize the AuthorizedConnectAppPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [AuthorizedConnectAppPage] AuthorizedConnectAppPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of AuthorizedConnectAppInstance
            # @param [Hash] payload Payload response from the API
            # @return [AuthorizedConnectAppInstance] AuthorizedConnectAppInstance
            def get_instance(payload)
              AuthorizedConnectAppInstance.new(@version, payload, account_sid: @solution[:account_sid])
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.AuthorizedConnectAppPage>'
            end
          end

          class AuthorizedConnectAppContext < InstanceContext
            ##
            # Initialize the AuthorizedConnectAppContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] connect_app_sid The connect_app_sid
            # @return [AuthorizedConnectAppContext] AuthorizedConnectAppContext
            def initialize(version, account_sid, connect_app_sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, connect_app_sid: connect_app_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/AuthorizedConnectApps/#{@solution[:connect_app_sid]}.json"
            end

            ##
            # Fetch a AuthorizedConnectAppInstance
            # @return [AuthorizedConnectAppInstance] Fetched AuthorizedConnectAppInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              AuthorizedConnectAppInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  connect_app_sid: @solution[:connect_app_sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.AuthorizedConnectAppContext #{context}>"
            end
          end

          class AuthorizedConnectAppInstance < InstanceResource
            ##
            # Initialize the AuthorizedConnectAppInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique id of the SubAccount this Connect App has
            #   access to.
            # @param [String] connect_app_sid The connect_app_sid
            # @return [AuthorizedConnectAppInstance] AuthorizedConnectAppInstance
            def initialize(version, payload, account_sid: nil, connect_app_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'connect_app_company_name' => payload['connect_app_company_name'],
                  'connect_app_description' => payload['connect_app_description'],
                  'connect_app_friendly_name' => payload['connect_app_friendly_name'],
                  'connect_app_homepage_url' => payload['connect_app_homepage_url'],
                  'connect_app_sid' => payload['connect_app_sid'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'permissions' => payload['permissions'],
                  'uri' => payload['uri'],
              }

              # Context
              @instance_context = nil
              @params = {
                  'account_sid' => account_sid,
                  'connect_app_sid' => connect_app_sid || @properties['connect_app_sid'],
              }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [AuthorizedConnectAppContext] AuthorizedConnectAppContext for this AuthorizedConnectAppInstance
            def context
              unless @instance_context
                @instance_context = AuthorizedConnectAppContext.new(
                    @version,
                    @params['account_sid'],
                    @params['connect_app_sid'],
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
            # @return [String] The company name set for this Connect App.
            def connect_app_company_name
              @properties['connect_app_company_name']
            end

            ##
            # @return [String] Human readable description of the app
            def connect_app_description
              @properties['connect_app_description']
            end

            ##
            # @return [String] A human readable name for the Connect App.
            def connect_app_friendly_name
              @properties['connect_app_friendly_name']
            end

            ##
            # @return [String] The public URL for this Connect App.
            def connect_app_homepage_url
              @properties['connect_app_homepage_url']
            end

            ##
            # @return [String] A string that uniquely identifies this app
            def connect_app_sid
              @properties['connect_app_sid']
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
            # @return [authorized_connect_app.Permission] Permissions authorized to this app
            def permissions
              @properties['permissions']
            end

            ##
            # @return [String] The URI for this resource
            def uri
              @properties['uri']
            end

            ##
            # Fetch a AuthorizedConnectAppInstance
            # @return [AuthorizedConnectAppInstance] Fetched AuthorizedConnectAppInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.AuthorizedConnectAppInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.AuthorizedConnectAppInstance #{values}>"
            end
          end
        end
      end
    end
  end
end