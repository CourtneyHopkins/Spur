module RottenTomatoes
    class Actor
        attr_accessor :name, :id, :characters

        def initialize( args = {} )
            args.each do |key, val|
                self.send("#{ key }=", val )
            end
        end

        def first_name
            name.split(' ').first
        end

        def last_name
            name.split(' ').last
        end
    end
end
