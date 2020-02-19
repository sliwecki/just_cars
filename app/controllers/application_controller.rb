class ApplicationController < ActionController::API

  def info
    render json: { version: Settings.api_version }
  end

  def routing_not_found
    render_error(Error::RoutingNotFound.new(params))
  end

  private

  #TEMP TODO AUTH
  def current_user
    @current_user ||= User.first
  end

  def render_error(object)
    render json: object, status: object.http_status
  end
end
