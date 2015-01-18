require('spec_helper')

describe(ToDoList) do
  describe("#description") do
    it("lets you give it a description") do
      test_to_do_list = ToDoList.new({:description => "scrub the zebra"})
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

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = ToDoList.new({:description => "learn SQL"})
      test_task.save()
      expect(ToDoList.all()).to(eq([test_task]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = ToDoList.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end
end
