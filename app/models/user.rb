class User
  # DATA
  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attributes)
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
  end

  def username
    @username
  end

  def travel_agent?
    @role == "travel_agent"
  end

  def password
    "•••••••"
  end
end
