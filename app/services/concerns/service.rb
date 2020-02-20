module Service
  extend ActiveSupport::Concern

  included do

    private

    attr_reader :form, :params, :user

    def validation_error
      Error::ValidationFailed.new(form.errors)
    end

    def build_result(object)
      ServiceResult.new(object)
    end
  end
end
