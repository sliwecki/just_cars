class Error < StandardError
  include ActiveModel::Serialization

  attr_reader :http_status

  def initialize(error, http_status, details)
    @error, @http_status, @details = error, http_status, details
  end

  def as_json(_args = nil)
    {
      status: @http_status,
      error: @error,
      details: @details
    }
  end
end
