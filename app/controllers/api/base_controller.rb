module Api
  class BaseController < ApplicationController
    before_action do
      request.format = :json
    end
  end
end
