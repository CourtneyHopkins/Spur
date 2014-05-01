require 'sinatra'

class Spur < Sinatra::Base

    get '/hi' do
        @status = 'working'
        erb :index
    end

    get '/add/:first/:last' do
        val = (params[:first].to_i + params[:last].to_i).to_s
        request.inspect
    end
    
end


