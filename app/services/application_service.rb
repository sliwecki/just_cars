class ApplicationService

  def self.call(attrs = {})
    new(attrs).call
  end

  private

  attr_reader :form

  def validation_error
    Error::ValidationFailed.new(form.errors)
  end

  def build_result(object)
    ServiceResult.new(object)
  end
end
