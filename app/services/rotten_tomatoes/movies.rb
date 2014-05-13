module RottenTomatoes
    class Movies < Array

        class << self

            def list_types
                %w( box_office in_theaters opening upcoming )
            end

            RottenTomatoes::Movies.list_types.each do |list|
                define_method "#{ list }_releases" do
                    movies = RottenTomatoes::Api.new( list: list ).get_movies
                    form_collection movies
                end
            end

            def form_collection( movies_hash = {} )
                arr = movies_hash.collect do |movie_obj|
                    RottenTomatoes::Movie.new movie_obj
                end

                RottenTomatoes::Movies.new(arr)
            end
        end

        def verify_movie_list 
            raise Exception unless is_valid_movie_list?
        end

        def is_valid_movie_list?
             RottenTomatoes::Movies.list_types.include?( list )
        end
    end
end
