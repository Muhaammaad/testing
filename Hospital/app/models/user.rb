class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :histories

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name,:last_name,:age,:male,:admin,:email, :password, :password_confirmation, :remember_me
end
