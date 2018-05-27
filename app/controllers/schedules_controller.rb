class SchedulesController < ApplicationController

  def show
    @schedule = Schedule.find params[:id]
  end

  def new
    @schedule = Schedule.new
    @clients = Client.all
    @services = Service.all
  end

  def create
    @schedule = Schedule.new(schedule_params)

    @schedule.client = schedule_client
    @schedule.save!

    schedule_services_ids.each do |service_id|
      task = ScheduleTask.new
      task.schedule = @schedule
      task.service= Service.find service_id
      task.save!
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:date_start, :date_end)
  end

  def schedule_client
    Client.find params[:schedule][:client]
  end

  def schedule_services_ids
    params[:schedule][:services]
  end
end