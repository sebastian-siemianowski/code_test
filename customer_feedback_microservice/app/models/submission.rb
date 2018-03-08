class Submission
  include ActiveModel::Model

  attr_accessor :name,
                :business_name,
                :telephone_number,
                :email,
                :contact_time,
                :notes,
                :reference

  attr_reader :access_token,
              :pGUID,
              :pAccName,
              :pPartner

  validates :name, :business_name, :telephone_number, :presence => true
  validates_length_of :name, :maximum => 100, :allow_blank => false
  validates_length_of :business_name, :maximum => 100, :allow_blank => false
  validates_length_of :telephone_number, :maximum => 13, :allow_blank => false
  validates_length_of :email, :maximum => 80, :allow_blank => true
  validates_length_of :notes, :maximum => 255, :allow_blank => true
  validates_length_of :reference, :maximum => 50, :allow_blank => true

  def initialize
    @access_token = ENV['LEAD_API_ACCESS_TOKEN']
    @pGUID = ENV['LEAD_API_PGUID']
    @pAccName = ENV['LEAD_API_PACCNAME']
    @pPartner = ENV['LEAD_API_PPARTNER']
   end
end