# coding: utf-8
#
# Author:: Alessio Rocchi (<alessio.rocchi@staff.aruba.it>)
# © Copyright ArubaCloud.
#
# LICENSE: MIT (http://opensource.org/licenses/MIT)
#

require 'fog/arubacloud/service'
require 'fog/arubacloud/error'
require 'benchmark'

module Fog
  module ArubaCloud
    class Compute

      class Real
        # Return the server details
        # @return [Excon::Response]
        def get_server_details(server_id)
          body = self.body('GetServerDetails').merge({:ServerId => server_id})
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'GetServerDetails', 'GetServerDetails, error')
          }
          Fog::Logger.debug("GetServerDetails time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new( "Error during GetServerDetails request. Error message: \n#{response}" )
          end
        end # get_server_details
      end # Real

      class Mock
        def get_server_details(server_id)
          raise Fog::Errors::MockNotImplemented.new(
              'Mock not implemented. Feel free to contribute.'
          )
        end # get_server_details
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
