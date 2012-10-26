module Doorkeeper
  module Request
    class Code
      def self.build(server)
        new(server.client_via_uid, server)
      end

      attr_accessor :client, :server

      def initialize(client, server)
        @client, @server = client, server
      end

      def request
        @request ||= OAuth::CodeRequest.new(client, server.current_resource_owner, server.parameters)
      end

      def authorize
        request.authorize
      end
    end
  end
end
