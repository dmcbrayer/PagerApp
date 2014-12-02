class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :org_users
  has_many :organizations, :through => :org_users
  has_many :messages


  def full_name
  	full_name = self.first_name + " " + self.last_name
  end

end
