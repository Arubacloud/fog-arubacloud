# coding: utf-8
#
# Author:: Ugo Vierucci (<ugo.vierucci@staff.aruba.it>)
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
        # Return the correct package id 
        # @return [Excon::Response]

        def get_package_id( name="small" )
          body_r = self.body('GetPreConfiguredPackages').merge(
            {
              :HypervisorType => 4
            }
          )
          response = nil
          time = Benchmark.realtime {
            response = request( body_r, 'GetPreConfiguredPackages', "Smart_vm getPackageID error"  )
          }
          Fog::Logger.debug("GetPreConfiguredPackages time: #{time}")
          if response['Success']
            response['Value'].each { | package |
              packageId  = package['PackageID']
               package['Descriptions'].each { | description |
                languageID = description['LanguageID']
                packageName = description['Text']
                if (languageID == 2) and (packageName.downcase == name.downcase) then
                   return packageId
                end
              }
            }
          else
           raise Fog::ArubaCloud::Errors::RequestError.new("Error during the get_package_id. Object: \n#{body}", response=response)
          end
          return 1
        end
      end # Real

      class Mock
        def get_package_id(  name )
          raise Fog::Errors::MockNotImplemented.new(
              'Mock not implemented. Feel free to contribute.'
          )
        end # get_package_id
      end # Mock

    end # Compute
  end # ArubaCloud
end # Fog
