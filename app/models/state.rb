class State < ActiveRecord::Base

  validates_presence_of  :name

  # Associations
  has_many :regions

end
