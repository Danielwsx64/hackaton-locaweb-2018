class DialogFlowParser
  def self.parse(message)
    {
      "speech": message,
      "displayText": message,
      "data": "",
      "source": "Bot"
    }
  end
end
