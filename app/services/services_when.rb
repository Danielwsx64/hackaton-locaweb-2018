class ServicesWhen
  def initialize(params, parser=DialogFlowParser)
    @params = params
    @parser = parser
  end

  def execute
    message = humanize(services_found)
    parser.parse message
  end

  def when_is_possible(services)
    duration = 0
    services.each do |s|
      duration += s.duration
    end

    days = duration / Setting.first.work_hours

    if Schedule.any?
      schedule = Schedule.order(date_end: :desc).first
      schedule.date_end + days.round.days
    else
      Time.now + days.round.days
    end
  end

  private

  attr_reader :params, :parser

  def services_found
    Service.all.select do |service|
      service.title.match(regex) || service.description.match(regex)
    end
  end

  def regex
    @regex ||= /#{search_param}/i
  end

  def search_param
    params[:queryResult][:parameters][:any]
  end

  def humanize(services)
    if services.blank?
      return "Infelizmente não possuimos serviços relacionados a #{search_param}"
    end

    date = when_is_possible(services)

    message = "Eu consigo entregar esse serviço no dia #{date.strftime("%d/%m/%Y")}"

    message
  end
end
