class Industry < ActiveRecord::Base

  # Associations
  has_many :sub_industries
  has_many :workers

end
