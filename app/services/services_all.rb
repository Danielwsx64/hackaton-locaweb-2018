class ServicesAll
  def initialize(params, parser=DialogFlowParser)
    @params = params
    @parser = parser
  end

  def execute
    message = humanize(Service.all)
    parser.parse message
  end

  private

  attr_reader :params, :parser

  def humanize(services)
    return 'Ainda não estamos prestando serviços' if services.blank?

    message = "Os nossos serviços são \n"

    services.each do |service|
      message << "#{service.title} - #{service.description}; \n"
    end

    message
  end
end
