class State < ActiveRecord::Base

  validates_presence_of  :name

  # Associations
  has_many :regions
  has_many :workers

end
