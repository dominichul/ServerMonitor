##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkflowContext < InstanceContext
            class WorkflowStatisticsList < ListResource
              ##
              # Initialize the WorkflowStatisticsList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] workflow_sid The workflow_sid
              # @return [WorkflowStatisticsList] WorkflowStatisticsList
              def initialize(version, workspace_sid: nil, workflow_sid: nil)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, workflow_sid: workflow_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.WorkflowStatisticsList>'
              end
            end

            class WorkflowStatisticsPage < Page
              ##
              # Initialize the WorkflowStatisticsPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [WorkflowStatisticsPage] WorkflowStatisticsPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of WorkflowStatisticsInstance
              # @param [Hash] payload Payload response from the API
              # @return [WorkflowStatisticsInstance] WorkflowStatisticsInstance
              def get_instance(payload)
                WorkflowStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    workflow_sid: @solution[:workflow_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.WorkflowStatisticsPage>'
              end
            end

            class WorkflowStatisticsContext < InstanceContext
              ##
              # Initialize the WorkflowStatisticsContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] workflow_sid The workflow_sid
              # @return [WorkflowStatisticsContext] WorkflowStatisticsContext
              def initialize(version, workspace_sid, workflow_sid)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, workflow_sid: workflow_sid}
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workflows/#{@solution[:workflow_sid]}/Statistics"
              end

              ##
              # Fetch a WorkflowStatisticsInstance
              # @param [String] minutes The minutes
              # @param [Time] start_date The start_date
              # @param [Time] end_date The end_date
              # @param [String] task_channel The task_channel
              # @param [String] split_by_wait_time The split_by_wait_time
              # @return [WorkflowStatisticsInstance] Fetched WorkflowStatisticsInstance
              def fetch(minutes: :unset, start_date: :unset, end_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
                params = Twilio::Values.of({
                    'Minutes' => minutes,
                    'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                    'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                    'TaskChannel' => task_channel,
                    'SplitByWaitTime' => split_by_wait_time,
                })

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                WorkflowStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    workflow_sid: @solution[:workflow_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.WorkflowStatisticsContext #{context}>"
              end
            end

            class WorkflowStatisticsInstance < InstanceResource
              ##
              # Initialize the WorkflowStatisticsInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The workspace_sid
              # @param [String] workflow_sid The workflow_sid
              # @return [WorkflowStatisticsInstance] WorkflowStatisticsInstance
              def initialize(version, payload, workspace_sid: nil, workflow_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'cumulative' => payload['cumulative'],
                    'realtime' => payload['realtime'],
                    'workflow_sid' => payload['workflow_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'workspace_sid' => workspace_sid, 'workflow_sid' => workflow_sid}
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [WorkflowStatisticsContext] WorkflowStatisticsContext for this WorkflowStatisticsInstance
              def context
                unless @instance_context
                  @instance_context = WorkflowStatisticsContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['workflow_sid'],
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
              # @return [Hash] The cumulative
              def cumulative
                @properties['cumulative']
              end

              ##
              # @return [Hash] The realtime
              def realtime
                @properties['realtime']
              end

              ##
              # @return [String] The workflow_sid
              def workflow_sid
                @properties['workflow_sid']
              end

              ##
              # @return [String] The workspace_sid
              def workspace_sid
                @properties['workspace_sid']
              end

              ##
              # @return [String] The url
              def url
                @properties['url']
              end

              ##
              # Fetch a WorkflowStatisticsInstance
              # @param [String] minutes The minutes
              # @param [Time] start_date The start_date
              # @param [Time] end_date The end_date
              # @param [String] task_channel The task_channel
              # @param [String] split_by_wait_time The split_by_wait_time
              # @return [WorkflowStatisticsInstance] Fetched WorkflowStatisticsInstance
              def fetch(minutes: :unset, start_date: :unset, end_date: :unset, task_channel: :unset, split_by_wait_time: :unset)
                context.fetch(
                    minutes: minutes,
                    start_date: start_date,
                    end_date: end_date,
                    task_channel: task_channel,
                    split_by_wait_time: split_by_wait_time,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkflowStatisticsInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.WorkflowStatisticsInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end