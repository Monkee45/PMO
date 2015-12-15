require_relative 'spec_helper'
require 'runner/manager'

module Runner
  describe Manager do
    before do
      $stdout = StringIO.new
      @rating = 50
      @manager = Manager.new('mandy', @rating, 'manager')
    end

    it "can be identified as a manager" do
      @manager.manager?.should == true
    end

    it "increases by 30 when rated up" do
      @manager.rated_up(2)
      @manager.rating.should == @rating+(15*2)
    end

    it "decreases by 15 when rated down" do
      @manager.rated_down(2)
      @manager.rating.should == @rating-(15*2)
    end

    it "is set to zero (0) if rated down below zero" do
      1.upto(3) do
        @manager.rated_down(2)
      end
      @manager.rating.should == 0
    end

  end
end
