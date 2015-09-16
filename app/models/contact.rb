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

  def read_attribute_for_validation(key)
    send(key)
  end

  def save
    if self.valid?
      Notifier.contact_notification(self).deliver
      return true
    end
    false
  end
end
