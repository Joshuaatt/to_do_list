require('sinatra')
require('sinatra/reloader')
require('./lib/to_do_list')
also_reload('./lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @tasks = ToDoList.all()
  erb(:index)
end

post("/to_do_list") do
  description = params.fetch("description")
  task = ToDoList.new({:description => description})
  task.save()
  erb(:results)
end
