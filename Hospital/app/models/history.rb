class History < ActiveRecord::Base
  belongs_to :User
  belongs_to :Pdetail

  attr_accessible :comments, :date, :disease,:User_id,:Pdetail_id
end
