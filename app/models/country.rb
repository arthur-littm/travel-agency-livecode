class Country
  # DATA
  attr_reader :name, :continent
  attr_accessor :id

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @continent = attributes[:continent]
  end
end
