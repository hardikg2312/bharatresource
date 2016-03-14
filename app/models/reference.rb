class Reference < ActiveRecord::Base

  # Associations
  belongs_to :worker

  #validations
  before_validation :normalize_email
  validates_presence_of :name, :mobile_no
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true
  validates_length_of :mobile_no,    :is => 10, :allow_blank => true
  validates_format_of :mobile_no, :with => /\A[0-9]+\Z/, :message => " : Please enter correct mobile No", :allow_blank => true


  protected
    def normalize_email
      email.downcase! if email
      return true
    end

end
