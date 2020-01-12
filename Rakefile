desc 'Create a database and test database from a database dump'
task :build, [:volunteer_tracker] do |t, args|
  system("createdb #{args.volunteer_tracker}")
  system("psql #{args.volunteer_tracker} < database_backup.sql")
  system("createdb -T #{args.volunteer_tracker} #{args.volunteer_tracker + '_test'}")
end
