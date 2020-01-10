class Volunteer
  attr_reader :id
  attr_accessor :name, :hours

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

 
end
