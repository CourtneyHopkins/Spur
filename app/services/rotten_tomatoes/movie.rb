module RottenTomatoes
    class Movie

        attr_accessor :id, :title, :year, :mpaa_rating, :runtime,
                      :critics_consensus, :release_dates, :ratings, :synopsis, 
                      :posters, :abridged_cast, :alternate_ids, :links
        
        def initialize( args = {} )
            args.each do |key, val|
                self.send("#{ key }=", val )
            end

            build_actors
        end

        def build_actors
            actors = []
            abridged_cast.each do |actor|
                actors << RottenTomatoes::Actor.new( actor )
            end

            self.abridged_cast = actors
        end
    end
end
