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
              :pPartner,
              :message,
              :remote_errors

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

  def save
    if valid?
      url = "#{ENV['LEAD_API_URI']}/api/v1/create"
      puts self.to_json

      result = HTTParty.post(url,
                             :body => body.to_query,
                             :headers => {"Content-Type" => "application/x-www-form-urlencoded"}).parsed_response
      puts result
      @message = result['message']
      if result['errors']
        result['errors'].each do |error|
          self.errors.add(:base, error)
        end
        false
      else
        true
      end
    else
      false
    end

  end

  def update_params(params = {})
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def persisted?
    false
  end

  private

  def body
    {name: name,
     business_name: business_name,
     telephone_number: telephone_number,
     email: email,
     contact_time: contact_time,
     notes: notes,
     reference: reference,
     access_token: access_token,
     pGUID: pGUID,
     pAccName: pAccName,
     pPartner: pPartner}
  end
end