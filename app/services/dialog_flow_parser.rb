class DialogFlowParser
  def self.parse(message)
    {
      "fulfillmentText": message,
      "source": "Bot"
    }
  end
end
