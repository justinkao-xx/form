class FormController < ApplicationController
  def home
 
  end
  def converter
    @arv = params[:x].to_i * 0.0622983046
    render :action => :converter
  end
  def about
    
  end
end
