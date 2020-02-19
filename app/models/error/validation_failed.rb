class Error
  class ValidationFailed < Error

    def initialize(data)
      super(:validation_failed, 400, data)
    end
  end
end
