
require_relative 'ratings'

module Runner
  class TeamMember
  attr_reader :name
  attr_accessor :rating
  attr_accessor :reviews
  include Ratings

    def initialize (name, rating=10, reviews=0)
      @name = name.capitalize
      @rating = rating
      @reviews = reviews
    end

    def to_s
      "#{@name} has a rating of #{@rating} after having #{@reviews} reviews"
    end

  end

  if __FILE__ == $PROGRAM_NAME
    suresh = TeamMember.new('suresh')
    puts suresh.to_s
    1.upto(20) do
      suresh.rated_up
    end
    1.upto(15) do
      suresh.rated_down
    end
    puts suresh.to_s
  end
end
