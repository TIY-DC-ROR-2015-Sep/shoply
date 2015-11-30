module Api
  class BaseController < ApplicationController
    class UserRequired < StandardError
    end

    before_action do
      request.format = :json
    end

    rescue_from UserRequired do
      render json: { error: "You must log in" }, status: 403
    end

    def who_am_i
      render json: { id: current_user.id, email: current_user.email }
    end

    #def current_user
    #  super || raise(UserRequired)
    #end
  end
end
