require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all
    erb(:projects)
end

get('/projects/:id/volunteers/:volunteer_id') do
  @volunteer = volunteer.find(params[:volunteer_id].to_i())
  erb(:volunteer)
end

post('/projects/:id/volunteers') do
  @project = Project.find(params[:id].to_i())
  volunteer = volunteer.new(params[:volunteer_name], params[:hours], @project.id, nil)
  volunteer.save()
  erb(:project)
end

patch('/projects/:id/volunteers/:volunteer_id') do
  @project = Project.find(params[:id].to_i())
  volunteer = volunteer.find(params[:volunteer_id].to_i())
  volunteer.update(params[:name], params[:hours], @project.id)
  erb(:project)
end

delete('/projects/:id/volunteers/:volunteer_id') do
  volunteer = volunteer.find(params[:volunteer_id].to_i())
  volunteer.delete
  @project = Project.find(params[:id].to_i())
  erb(:project)
end

get('/') do
  @projects = Project.all
  erb(:projects)

  get('/projects') do
      @projects = Project.all
    erb(:projects)
  end

  get('/projects/new') do
    erb(:new_project)
  end

  post('/projects') do
    name = params[:project_name]
    project = Project.new({:name => name, :id => nil})
    project.save()
    @projects = Project.all()
    erb(:projects)
  end

  get('/projects/:id') do
    @project = Project.find(params[:id].to_i())
    if @project == nil
      erb(:go_back)
    else
      erb(:project)
    end
  end

  get('/projects/:id/edit') do
    @project = Project.find(params[:id].to_i())
    erb(:edit_project)
  end

  patch('/projects/:id') do
    if params[:buy]
      @project = Project.find(params[:id].to_i())
      @project.sold
    else
      @project = Project.find(params[:id].to_i())
      @project.update(params[:name])
    end
    @projects = Project.all
    erb(:projects)
  end

  delete('/projects/:id') do
    @project = Project.find(params[:id].to_i())
    @project.delete()
    @projects = Project.all
    erb(:projects)
  end
