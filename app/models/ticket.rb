class Ticket
  attr_accessor :id
  attr_reader :user, :country
  # STATE?
  def initialize(attributes = {})
    @id = attributes[:id]
    @user = attributes[:user] # User instance
    @country = attributes[:country] # Country instance
  end
end
