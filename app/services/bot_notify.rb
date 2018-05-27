class BotNotify
  def initialize(params, parser=DialogFlowParser)
    @params = params
    @parser = parser
  end

  def execute
    Notification.create(content: notification_content, read: false)

    parser.parse message
  end

  private

  attr_reader :params, :parser

  def notification_content
    "Olá, um cliente que está em contato via chat precisa de atendimento" \
      " especializado. Segue a mensagem: #{chat_message}"
  end

  def chat_message
    params[:queryResult][:queryText]
  end

  def message
    'Me da um minutinho, já te respondo...'
  end
end
