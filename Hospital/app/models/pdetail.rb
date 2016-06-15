class Pdetail < ActiveRecord::Base
has_many :histories

accepts_nested_attributes_for :histories
  attr_accessible :age, :contact, :first_name, :last_name, :male
end
