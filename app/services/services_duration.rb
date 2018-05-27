class ServicesDuration
  def initialize(params, parser=DialogFlowParser)
    @params = params
    @parser = parser
  end

  def execute
    message = humanize(services_found)
    parser.parse message
  end

  private

  attr_reader :params, :parser

  def services_found
    Service.all.select do |service|
      service.title.match(regex)
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

    message = "Os tempos para os serviços são aproximados, \n"

    services.each do |service|
      message << " para #{service.title} o tempo médio é de #{service.duration} horas; \n"
    end

    message
  end
end
