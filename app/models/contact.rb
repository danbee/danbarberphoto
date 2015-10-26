class Contact
  include ActiveModel::Validations

  validates_presence_of :email, :name, :message

  validates :email, email: true

  attr_accessor :id, :email, :subject, :name, :message

  def initialize(attributes = {})
    attributes.each do |key, value|
      send("#{key}=", value)
    end
  end
end
