class Worker < ActiveRecord::Base

  # Associations
  belongs_to :state
  belongs_to :region
  belongs_to :industry
  belongs_to :sub_industry

  #filters

  def set_br_id
    "BR000#{rand(9999999) + 10000000}"
  end

end
