class Organization < ActiveRecord::Base
	has_many :org_users
	has_many :users, :through => :org_users

	validates :name, presence: true
	validates :variety, presence: true
	
end
