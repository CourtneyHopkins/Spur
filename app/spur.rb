require 'sinatra'
require 'sinatra-initializers'
require 'sinatra/activerecord'
require './app/services/rotten_tomatoes'

class Spur < Sinatra::Base

    register Sinatra::Initializers
    register Sinatra::ActiveRecordExtension

    RottenTomatoes::Config.api_key = ENV['ROTTENTOMATOES_KEY']

    get '/hi' do
        @status = 'working'
        erb :index
    end

    get '/add/:first/:last' do
        val = (params[:first].to_i + params[:last].to_i).to_s
        request.inspect
    end
    
end


