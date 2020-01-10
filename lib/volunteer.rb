class Volunteer
  attr_reader :id
  attr_accessor :name, :hours, :project_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @hours = attributes.fetch(:hours)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def self.all
      returned_volunteers = DB.exec("SELECT * FROM volunteers;")
      volunteers = []
      returned_volunteers.each() do |volunteer|
        name = volunteer.fetch("name")
        hours = volunteer.fetch("hours")
        project_id = volunteer.fetch("project_id").to_i
        id = volunteer.fetch("id").to_i
        volunteers.push(Volunteer.new({:name => name, :hours => hours, :project_id => project_id, :id => id}))
      end
      volunteers
    end

    def save
    result = DB.exec("INSERT INTO volunteers (name, hours, project_id) VALUES ('#{@name}', '#{@hours}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(volunteer_to_compare)
    (self.name() == volunteer_to_compare.name()) && (self.project_id() == volunteer_to_compare.project_id())
  end

end
