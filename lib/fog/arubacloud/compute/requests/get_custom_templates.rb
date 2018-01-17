# coding: utf-8
#
# Author:: Dangleterre Michaël
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
        def get_custom_templates
          body = self.body('GetAvailablePersonalTemplates')
          response = nil
          time = Benchmark.realtime {
            response = request(body, 'GetAvailablePersonalTemplates', 'GetAvailablePersonalTemplates Error')
          }
          Fog::Logger.debug("GetAvailablePersonalTemplates time: #{time}")
          if response['Success']
            response
          else
            raise Fog::ArubaCloud::Errors::RequestError.new('Error in request.')
          end
        end # get_custom_templates

        class Mock
          def get_custom_templates
            raise Fog::Errors::MockNotImplemented.new(
                      'Mock not implemented. Feel free to contribute.'
                  )
          end # get_custom_templates
        end # Mock
      end # Real

    end # Compute
  end # ArubaCloud
end # Fog
