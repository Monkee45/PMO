require_relative 'team_member'
require_relative 'die'
require 'CSV'

module Runner
  class Project
    attr_accessor :name
    attr_reader :members

    def initialize(name)
      @name = name.capitalize
      @members = []
    end

    def add_member(member)
      @members << member
    end

    def show_members
      puts "#{self.name} has the following members:"
      sorted_members = @members.sort {|a,b| b.rating <=> a.rating}
      sorted_members.each do |member|
        puts "\t - #{member.name} rated #{member.rating}"
      end

      strong_members, weak_members = @members.partition{|member| member.strong?}
      puts "\n\nThe STRONG team members are:"
      strong_members.each do |member|
        puts "#{member.name}*"
      end
      puts "\n\nThe WEAK team members are:"
      weak_members.each do |member|
        puts "#{member.name}~"
      end

    end

    def review(cycles)
      dice = Die.new
      1.upto(cycles) do |cycle|
        puts "CYCLE #{cycle}:"
        @members.each do |reviewer|
          puts "Review being done by #{reviewer.name}:"
          @members.each do |reviewee|
            if reviewee != reviewer
              puts "#{reviewer.name} is rating #{reviewee.name}"
              case dice.roll
              when 1,2
                reviewee.rated_down
              when 4,5,6
                reviewee.rated_up
              else
                puts "#{reviewer.name} doesn't know enough about #{reviewee.name}'s work"
              end
            end
          end # reviewee
        end # reviewer
        show_members
      end # cycle
    end # review

    def save_final_ratings
      CSV.open("#{Dir.home}/repos/PMO/bin/final_ratings.csv", 'w') do |csv|
        @members.each do |member|
          csv_string = [member.name,member.rating.to_s]
          csv << csv_string
        end
      end
    end

  end

  if __FILE__ == $PROGRAM_NAME
    suresh = TeamMember.new('suresh')
    vijay = TeamMember.new('vijay')
    ganesh = TeamMember.new('ganesh')
    r12upgrade = Project.new("R12-Upgrade")
    r12upgrade.add_member(suresh)
    r12upgrade.add_member(vijay)
    r12upgrade.add_member(cd ganesh)
    r12upgrade.show_members
    r12upgrade.review(2)
    r12upgrade.save_final_ratings
  end

  end
