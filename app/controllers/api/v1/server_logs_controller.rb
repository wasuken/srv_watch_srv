# coding: utf-8
class Api::V1::ServerLogsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @name = params[:name]
    srv = Server.find_by(name: @name)
    logs = ServerLog
             .joins(:log)
             .where('server_id = ?', srv.id)
    render json: {
             server: {
               name: srv.name,
               ip_address: srv.ip_address,
               mac_address: srv.mac_address
             },
             logs: logs.select('logs.name as name').map{|log| log.name}.uniq.map{|name|
               {
                 name: name,
                 data: logs.where('logs.name = ?', name).select('value').to_json
               }
             }
           }
    # render json: ServerLog
    #          .joins(:server)
    #          .joins(:log)
    #          .select('ip_address, value, date_point, logs.name as log_name')
    #          .where('servers.name = ?', @name)
  end

  def create
    @server_id = params[:server_id]
    @server_name = params[:server_name]
    @log_name = params[:log_name]
    @ip_address = params[:ip_address]
    @mac_address = params[:mac_address]
    @other_info = params[:other_info]
    @value = params[:value]
    @date_point = params[:date_point]

    log = Log.create(date_point: @date_point, value: @value, name: @log_name)
    srv = Server.find_by(@server_id)
    unless @server_id || srv
      srv = Server.create(
        name: @server_name,
        ip_address: @ip_address,
        mac_address: @mac_address,
        other_info: @other_info
      )
    end
    ServerLog.create(server_id: srv.id, log_id: log.id)

    render json: {server_id: srv.id}
  end
end
