class FormController < ApplicationController
  # Get .xml from HTTP
  def get_rates
  today_path = Rails.root.join 'rates', "#{Date.today.to_s}.xml"

  Hash[Hash.from_xml(if File.exists? today_path
                       File.read today_path
                     else
                       xml = Net::HTTP.get URI 'http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml'
                       File.write today_path, xml
                       xml
                     end)["Envelope"]["Cube"]["Cube"]["Cube"].map &:values]
  end
  # Home
  def home
 
  end
  # Coverter
  def converter
    @currency_list = get_rates
    rate = unless get_rates[params[:key]] == nil
      get_rates[params[:key]].to_d
    else
      get_rates[params[:key]].to_i
    end
    @arv = params[:number].to_i * rate
    @key = unless params[:key] == nil
      params[:key,].to_s + " "
    else
      "USD "
    end
    render 'converter'
  end
  # About
  def about
    
  end
  
end
