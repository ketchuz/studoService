class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :scorable, polymorphic: true

  before_save :default_values

  def default_values
  	self.num_tries ||= 0
  	self.num_correct ||= 0
  	self.efficiency_percentage ||= 0.0
  end
end
