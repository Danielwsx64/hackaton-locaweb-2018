module Api
  class BotController < ApplicationController
    skip_before_action :verify_authenticity_token

    ACTIONS_SERVICES = {
      test: ServicesAll,
      services_all: ServicesAll,
      services_finder: ServicesFinder,
      services_price: ServicesPrice,
      services_duration: ServicesDuration,
      notify: BotNotify,
      services_when: ServicesWhen,
      schedules_point: SchedulePoint
    }

    def talk
      render json: service.new(params).execute
    end

    private

    def action
      params[:queryResult][:action].to_sym
    end

    def service
      ACTIONS_SERVICES.fetch(action)
    end
  end
end
