require_relative 'configuration'

module RottenTomatoes
    RottenTomatoes::Config.api_key = ENV['ROTTENTOMATOES_KEY']
end
