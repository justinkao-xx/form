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
    @currency_list = get_rates
    @arv = params[:number].to_i * params[:rate].to_i
    render :action => :converter
  end
  def about
    
  end
  
end
