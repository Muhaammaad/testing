class User < ActiveRecord::Base
  attr_accessible :age, :name

  validates :name, presence: true
end
