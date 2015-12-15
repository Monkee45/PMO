require_relative 'spec_helper'
require 'Runner/team_member'

module Runner
  describe TeamMember do
    before do
      $stdout = StringIO.new
      @name = "terry"
      @name1 = 'john'
      @rating = 25
      @member = TeamMember.new(@name, @rating)
      @member1 = TeamMember.new(@name1)
    end

    it "has a capitalized name" do
      @member.name.should == 'Terry'
    end

    it "has an initial rating" do
      @member.rating.should == 25
    end

    it "has a string representation" do
      @member.to_s.should == "Terry has a rating of 25 after having 0 reviews"
    end

    it "has a default rating when required" do
      @member1.rating.should == 10
    end

    it "increases by 15 when rated up" do
      @member.rated_up
      @member.rating.should == @rating+15
    end

    it "decreases by 15 when rated down" do
      @member.rated_down
      @member.rating.should == @rating-15
    end

    it "is set to zero (0) if rated down below zero" do
      1.upto(3) do
        @member.rated_down
      end
      @member.rating.should == 0
    end

    it "keeps count of the number of reviews a Team Member has had" do
      @member1.rated_up
      @member1.rated_down
      @member1.rated_up
      @member1.reviews.should == 3
    end

    context "with a rating > 79" do
      before do
        @member1 = TeamMember.new('danny', 80)
      end
      it "is a strong performer" do
        @member1.should be_strong
      end
    end

    context "with a rating < 50" do
      before do
        @member1 = TeamMember.new('danny', 49)
      end
      it "is a weak performer" do
        @member1.should_not be_strong
      end
    end

  end
end
