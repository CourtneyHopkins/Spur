require 'faraday'
module RottenTomatoes
    class Api
        attr_accessor :list

        API_URI = 'http://api.rottentomatoes.com'
        API_VERSION = '/api/public/v1.0'
        CONTENT_TYPE = 'json'

        def initialize( args = {} )
            @list = args[ :list ]
        end

        def full_path
            "#{ API_VERSION }/lists/movies/#{ list }.#{ CONTENT_TYPE }?apikey=#{RottenTomatoes::Config.api_key}"
        end

        def get_movies
            parse_response( connection.get full_path )[ :movies ]
        end

        def parse_response( response )
            JSON.parse( response.body ).symbolize_keys
        end

        def connection
            Faraday.new( url: API_URI ) do |faraday|
              faraday.request  :url_encoded             # form-encode POST params
              faraday.response :logger                  # log requests to STDOUT
              faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
            end
        end
    end
end
