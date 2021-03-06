class Worker < ActiveRecord::Base

  # Associations
  belongs_to :state
  belongs_to :region
  belongs_to :industry
  belongs_to :sub_industry
  has_many :references

  #validations
  before_validation :normalize_email
  validates_presence_of :name, :dob, :mobile_no
  validates_inclusion_of :br_ratings, :in => 0..5, :allow_blank => true
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

  def get_profile_photo
    photo.to_s
  end

  def get_photo_id_proof
    photo_id_proof.to_s
  end

  def get_address_proof_photo
    address_proof_photo.to_s
  end

  def get_age
    Time.now.year - dob.year
  end

  def get_ready_to_join
    case ready_to_join
    when '1'
      'Not looking actively for job'
    when '2'
      'Need to switch if good offer is made.'
    when '3'
      'Very actively searching'
    end
  end

  protected
    def normalize_email
      email.downcase! if email
      return true
    end

end
