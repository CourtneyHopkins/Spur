require 'faraday'
module RottenTomatoes
    class Api
        attr_accessor :list

        API_URI = 'http://api.rottentomatoes.com'
        API_VERSION = '/api/public/v1.0'
        MOVIE_LIST_TYPES = %w( box_office in_theaters opening upcoming )
        CONTENT_TYPE = 'json'

        def initialize( args = {} )
            @list = args[ :list ]
            verify_movie_list
             
        end

        def full_path
            "#{ API_VERSION }/lists/movies/#{ list }.#{ CONTENT_TYPE }?apikey=#{RottenTomatoes::Config.api_key}"
        end

        def get_movies
            response = connection.get full_path
            content = JSON.parse( response.body ).symbolize_keys
            movies = content[ :movies ]
        end

        def verify_movie_list 
            raise Exception unless is_valid_movie_list?
        end

        def is_valid_movie_list?
             MOVIE_LIST_TYPES.include?( list )
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
