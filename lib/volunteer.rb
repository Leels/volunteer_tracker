class Volunteer
  attr_reader :id
  attr_accessor :name, :hours, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def self.all
      returned_volunteers = DB.exec("SELECT * FROM volunteers;")
      volunteers = []
      returned_volunteers.each() do |volunteer|
        name = volunteer.fetch("name")
        hours = volunteer.fetch("hours").to_f
        project_id = volunteer.fetch("project_id").to_i
        id = volunteer.fetch("id").to_i
        volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
      end
      volunteers
    end
end
