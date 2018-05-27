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

    Notification.create(content: notification_content, read: false)

    parser.parse humanize
  end

  private

  attr_reader :params, :parser

  def notification_content
    "Olá, um cliente agendou a entrega de um #{service_found.title} para o dia" \
      "#{@schedule.date_end.strftime("%d/%m/%Y")}."
  end

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
    ServicesWhen.new({}).when_is_possible([ service_found ])
  end

  def humanize()
    'Fechado! Mais tarde vou te pedir mais umas informações pra já começar a fazer. Obrigado! =D'
  end
end
