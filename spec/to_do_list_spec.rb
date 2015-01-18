require('rspec')
require('to_do_list')
require('pg')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(ToDoList) do
  describe("#description") do
    it("lets you give it a description") do
      test_to_do_list = ToDoList.new("scrub the zebra")
      expect(test_to_do_list.description()).to(eq("scrub the zebra"))
    end
  end
  describe(".all") do
    it("is empty at first") do
      expect(ToDoList.all()).to(eq([]))
    end
  end
  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = ToDoList.new({:description => "learn SQL"})
      task2 = ToDoList.new({:description => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end
end
