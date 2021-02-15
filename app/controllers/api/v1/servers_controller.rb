class Api::V1::ServersController < ApplicationController
  def index
    render json: Server.select('name').distinct
  end
end
