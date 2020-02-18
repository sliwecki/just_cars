module V1
  class OffersController < ApplicationController

    def index
      render json: {status: 'ok'}
    end

    def show
      render json: {status: 'ok'}
    end
  end
end
