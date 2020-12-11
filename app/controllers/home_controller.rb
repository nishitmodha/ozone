class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    @a = 'https://api.waqi.info/feed/'
    @b = 'ahmedabad'
    @c = '/?token=2c318510e7d4f4ea7e69d31f72a74cae9e684f9e'
    @url = @a+@b+@c
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output['status'] == 'error' 
      @final_op = "ERROR"
    else
      @final_op = @output['data']['aqi']
    end

      if @final_op <= 50
       @api_color = 'green'
    
      elsif @final_op >= 51 && @final_op <= 100
        @api_color = 'yellow'
    
      elsif @final_op >= 101 && @final_op <= 150
        @api_color = 'orange'

      elsif @final_op >= 151 && @final_op <= 200
        @api_color = 'red'

      elsif @final_op >= 201 && @final_op <= 250
        @api_color = 'purple'
      
      elsif @final_op >= 251 && @final_op <= 300
        @api_color = 'maroon'
    end

  end


end
