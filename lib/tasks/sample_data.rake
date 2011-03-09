require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_events
    make_users
    make_microposts
    make_relationships
  end
end #namespace :db do


def make_events
  100.times do |n|
    name = Faker::Lorem.sentence
    occur_type = Faker::Lorem.sentence
    location = "Toronto"
    start_date_time = DateTime.now.advance(:hours => n)
    end_date_time = start_date_time.advance(:hours => 2)
    Event.create!(:name => name,
                  :occur_type => occur_type,
                  :location => location,
                  :start_date_time => start_date_time,
                  :end_date_time => end_date_time,
                  :all_day => 0,
                  :free => 1)
  end
end #of make_events

def make_users
  admin = User.create!(:name => "Example User",
               :email => "example@railstutorial.org",
               :password => "foobar",
               :password_confirmation => "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end #of make_users

def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      user.microposts.create!(:content => Faker::Lorem.sentence(5))
    end
  end
end #of make_microposts
  
def make_relationships
  users = User.all
  user = users.first
  following = users[1..50]
  followers = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end #of make_relationships