class ServicesFinder
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
      message = "Poxa, não faço #{search_param}! Mas faço "

      Service.all.each do |service|
        message << "#{service.title}, "
      end

      return message
    end

    'Faço sim!'
  end
end
