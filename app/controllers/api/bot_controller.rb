module Api
  class BotController < ApplicationController

    skip_before_action :verify_authenticity_token

    ACTIONS_SERVICES = {
      all_services: ServicesAll,
    }

    def talk
      puts params
      render json: service.new(params).execute
    end

    private

    def action
      :all_services
    end

    def service
      ACTIONS_SERVICES.fetch(action)
    end
  end
end
