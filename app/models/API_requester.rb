class APIRequester < ApplicationRecord

  def self.get_aviationstack_data
    # url = 'http://api.aviationstack.com/v1/flights?access_key=16e6c3c05aa63a516a8b6ea32be8a235'
    url = 'http://api.aviationstack.com/v1/flights?access_key=16e6c3c05aa63a516a8b6ea32be8a235&arr_iata=IAH'

    # pp HTTParty.get(url)["data"][0]['arrival']

    data = HTTParty.get(url)["data"]

    terminals = data.each do |flight|
      pp "Flight"
      pp flight['flight']['iata']
      pp flight['airline']['name']
      pp flight['departure']['airport']
      pp flight['flight_date']
      pp flight['arrival']['scheduled']
    end


  end

end