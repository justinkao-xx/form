class FormController < ApplicationController
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
  def home
 
  end
  def converter
    @sign = params[:currency].to_s
    number = 
        if params[:number] == nil
          arv = 0
        else
          rate = params[:number].to_d
        end
    rate = 
        if params[:rate] == nil
          rate = 0
        else
          rate = params[:rate].to_d
        end
    @currency_list = get_rates
    @arv = number * rate
    render :action => :converter
  end
  def about
    
  end
  
end
