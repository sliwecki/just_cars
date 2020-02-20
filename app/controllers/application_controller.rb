class ApplicationController < ActionController::API
  include Knock::Authenticable

  def info
    render json: { version: Settings.api_version }
  end

  def routing_not_found
    render_error(Error::RoutingNotFound.new(params))
  end

  private

  def render_error(object)
    render json: object, status: object.http_status
  end
end
