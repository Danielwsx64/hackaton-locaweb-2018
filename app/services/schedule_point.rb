class SchedulePoint
  def initialize(params, parser=DialogFlowParser)
    @params = params
    @parser = parser
  end

  def execute
    @client = Client.where(fb_id: fb_id).first

    unless @client
      @client = Client.create! name: 'Cliente', fb_id: fb_id
    end

    @schedule = Schedule.new

    @schedule.date_start = date_start
    @schedule.date_end = date_end
    @schedule.client = @client
    @schedule.closed = true
    @schedule.save!

    @task = ScheduleTask.new
    @task.schedule = @schedule
    @task.service= service_found
    @task.save!

    parser.parse humanize
  end

  private

  attr_reader :params, :parser

  def service_found
    @service_found ||= Service.all.select do |service|
      service.title.match(regex)
    end.first
  end

  def regex
    @regex ||= /#{search_param}/i
  end

  def fb_id
    params[:originalDetectIntentRequest][:payload][:data][:sender][:id]
  end

  def search_param
    params[:queryResult][:parameters][:any]
  end

  def date_start
    days = service_found.duration / Setting.first.work_hours

    date_end - days.round.days
  end

  def date_end
    #params[:queryResult][:parameters][:date]
    ServicesWhen.new({}).when_is_possible([ service_found ])
  end

  def humanize()
    "O #{service_found.title} foi agendado para #{@schedule.date_end}, amanhã entraremos em contato para maiores detalhes. Obrigado por nos escolher =D"
  end
end
