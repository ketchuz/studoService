class Verb < ActiveRecord::Base
	has_many :scores, :as => :scorable
	validates :german, presence: true
	validates :english, presence: true
	validates :spanish, presence: true
end
