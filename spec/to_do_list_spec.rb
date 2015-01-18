require('rspec')
require('to_do_list')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(ToDoList) do
  before() do
    ToDoList.clear()
  end
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
  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_to_do_list = ToDoList.new("wash the lion")
      test_to_do_list.save()
      expect(ToDoList.all()).to(eq([test_to_do_list]))
    end
  end
  describe(".clear") do
    it("empties out all of the saved tasks") do
      ToDoList.new("wash the lion").save()
      ToDoList.clear()
      expect(ToDoList.all()).to(eq([]))
    end
  end
end
