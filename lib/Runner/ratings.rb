module Runner
  module Ratings

    def rated_up(factor=1)
      @rating += (15*factor)
      @reviews += 1
      puts "Awesome! #{@name} got rated up and is now #{@rating}"
    end

    def rated_down(factor=1)
      if (@rating -= (15*factor)) < 0
        @rating = 0
      end
      @reviews += 1
      puts "Unluckly! #{@name} got rated down and is now #{@rating}"
    end

    def strong?
      rating > 79
    end

  end
end
