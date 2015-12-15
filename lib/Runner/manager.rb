require_relative 'team_member'

module Runner
  class Manager < TeamMember

    def initialize(name, rating, type='manager')
      super(name, rating)
      @type = type.capitalize
      @factor = 2
    end

    def manager?
      @type == 'Manager'
    end

    def rated_up(factor=1)
      puts "OMG! This is a Manager!!!"
      super(@factor)
    end

    def rated_down(factor=1)
      puts "OMG! Bad news for the Manager!!!"
      super(@factor)
    end

  end
end
