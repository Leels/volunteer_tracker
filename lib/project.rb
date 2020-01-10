class Project
  attr_accessor :title
  attr_reader :id

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id).to_i
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      id = project.fetch("id").to_i
      title = project.fetch("title")
      projects.push(Project.new({:id => id, :title => title}))
    end
    projects
  end

  def ==(project_to_compare)
    if project_to_compare != nil
      self.title() == project_to_compare.title()
    else
      false
    end
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

end
