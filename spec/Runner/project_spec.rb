require_relative 'spec_helper'
require 'Runner/project'

module Runner
  describe Project do
    before do
#      $stdout = StringIO.new
      @name = "terry"
      @name1 = 'john'
      @rating = 25
      @member = TeamMember.new(@name, @rating)
      @member1 = TeamMember.new(@name1)
      @project = Project.new('r12 upgrade')
      @project.add_member(@member)
      @project.add_member(@member1)
    end

    it "has a capitalized name" do
      @project.name.should == 'R12 upgrade'
    end

    it "can have members added" do
      @project.members[0].to_s.should == "Terry has a rating of 25 after having 0 reviews"
    end

    it "can have multiple members added" do
      @project.members[1].to_s.should == "John has a rating of 10 after having 0 reviews"
    end

    context "when a high number is rolled" do
      it "adds 15 to the members rating" do
        Die.any_instance.stub(:roll).and_return(5)
        @project.review(2)
        @member.rating.should == @rating + (15*2)
      end
    end

    context "when a low number is rolled" do
      it "subtracts 15 from the members rating" do
        Die.any_instance.stub(:roll).and_return(2)
        @project.review(1)
        @member.rating.should == @rating - 15
      end
    end

    context "when the ratings are finished" do
      it "it saves the final results to a file" do
        Die.any_instance.stub(:roll).and_return(5)
        @project.review(1)
        @project.save_final_ratings
        puts Dir.home
        File.exist?("#{Dir.home}/repos/PMO/bin/final_ratings.csv").should be true
      end
    end

    end
end
