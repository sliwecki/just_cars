class Error
  class RoutingNotFound < Error

    def initialize(data)
      super(:not_found, 404, { path: "No route matches: /#{data[:path]}" })
    end
  end
end
