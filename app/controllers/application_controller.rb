class ApplicationController < ActionController::API

  def info
    render json: { version: Settings.api_version }
  end

  def routing_not_found
    render json: { error: 'not_found', description: "No route matches: /#{params[:path]}" }, status: 404
  end
end
