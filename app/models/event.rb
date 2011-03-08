# == Schema Information
# Schema version: 20110223063317
#
# Table name: events
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  occur_type      :string(255)
#  location        :string(255)
#  start_date_time :datetime
#  end_date_time   :datetime
#  all_day         :boolean
#  price           :integer
#  free            :boolean
#  created_at      :datetime
#  updated_at      :datetime
#  content         :text
#

class Event < ActiveRecord::Base
  
  attr_accessible :name, :occur_type, :location, :start_date_time, :end_date_time, 
                  :all_day, :price, :free, :content
  
  # All fields need to be filled out before the event can be created.
  # The only exception to this rule is "all_day" attribute. 
  validates :name,              :presence     => true,
                                :length       => {:maximum => 140}
  validates :occur_type,              :presence     => true
  validates :start_date_time,   :presence     => true
  validates :end_date_time,     :presence     => true
        
  OCCUR_TYPE = ['One-time','Reccurring']

end
