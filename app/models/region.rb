class Region < ActiveRecord::Base

  # Associations
  belongs_to :state
  has_many :workers

end
