class Worker < ActiveRecord::Base

  # Associations
  belongs_to :state
  belongs_to :region
  belongs_to :industry
  belongs_to :sub_industry

  #validations
  before_validation :normalize_email
  validates_presence_of :name, :dob, :mobile_no
  validates_inclusion_of :br_ratings, :in => 0..5
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :email,    :within => 3..100
  validates_length_of :mobile_no,    :is => 10, :allow_blank => true
  validates_format_of :mobile_no, :with => /\A[0-9]+\Z/, :message => " : Please enter correct mobile No", :allow_blank => true

  # callbacks
  before_save :check_for_birthdate

  # for image uploading
  mount_uploader :photo, ImageUploader
  mount_uploader :photo_id_proof, ImageUploader
  mount_uploader :address_proof_photo, ImageUploader

  def check_for_birthdate
    if dob < Time.now - 14.years
      return true
    else
      errors.add("Birthdate", "is less then 14 years")
      return false
    end
  end

  def set_br_id
    "BR0#{rand(9999999)}"
  end

  protected
    def normalize_email
      email.downcase! if email
      return true
    end

end
