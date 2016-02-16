class SubIndustry < ActiveRecord::Base

  # Associations
  belongs_to :industry
  has_many :workers

end
