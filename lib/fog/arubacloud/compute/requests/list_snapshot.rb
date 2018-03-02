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
        # List snapshot info  of a VM if exist a snapshot 
        def list_snapshot(id)
          body = self.body('GetServersList').merge(
            {
              :operationRequest =>  {  :ServerStatuses => {}  }
            }
          )
          body = self.body('GetServersList')
          response = nil
          dataresp = nil
          time = Benchmark.realtime {
            dataresp = request( body,  'GetServersList', "GetServersList Error"  )
          }

          if dataresp
            xs = dataresp["Value"]
            if xs
              xs.each do | x |
                if x["ServerId"] == id
                  if x["Snapshots"] != [] && x["Snapshots"].length > 0 
                    winfo = x['Snapshots'][0]
                    wcre = winfo['CreationDate']
                    wexp = winfo['ExpirationDate']
                    wdatecre = "unknow"
                    wdateexp = "unknow"
                    if wcre
                      w = wcre.match(/\/Date\((\d+\+\d+)\)\//)
                      if w && w.length > 1
                        wdatecre = DateTime.strptime(w[1], "%Q%z").strftime("%Y-%m-%d %H:%M:%S")
                      end
                    end
                    if wexp
                      w = wexp.match(/\/Date\((\d+\+\d+)\)\//)
                      if w && w.length > 1
                        wdateexp = DateTime.strptime(w[1], "%Q%z").strftime("%Y-%m-%d %H:%M:%S")
                      end
                    end
                    response = { "Success" => true , "credate" => wdatecre , "expdate" => wdateexp , "Req" => "list" , "Id" => id}
                    break
                  end
                end  
              end
            end
          end

          Fog::Logger.debug("GetServersList time: #{time}")
          if response && response['Success']
            response
          else
            return { "Success" => false , "Req" => "list", "Id" => id }
          end

        end #list_snapshot
      end #Real

      class Mock
        def list_snapshot
          response = Excon::Response.new
          response.status = 200
          response.body = {
              'ExceptionInfo' => nil,
              'ResultCode' => 0,
              'ResultMessage' => nil,
              'Success' => true
          }
          response.body
        end # list snapshot
      end # Mock

    end # Compute
  end # ArubaCloud
end #Fog
