require "rspec"

require_relative "../ruby/list"
describe List do
  let(:task) { double(:task, :complete! => true) }
  let(:attributes) { {:title => "my title", :tasks => [task]} }
  let(:list) { List.new attributes[:title], attributes[:tasks]  }
  context "#initialize" do
    it "sets the title to the given title" do
      expect(list.title).to eq attributes[:title]
    end
    it "defaults to an empty task list if none given" do
      list = List.new attributes[:title]
      expect(list.tasks).to be_empty
    end
    it "sets the task list to the given task list" do
      expect(list.tasks).to eq attributes[:tasks]
    end
  end

  context "#add_task" do
    it "appends the task to the task list" do
      expect {
        list.add_task(task)
      }.to change { list.tasks.count }.by(1)
    end
  end

  context "#delete_task" do
    it "removes the task from the task list by index" do
      expect {
        list.delete_task(0)
      }.to change { list.tasks.count }.by(-1)
    end
  end
  context "#complete_task" do
    it "marks the task as complete at the given index" do
      task.should_receive(:complete!)
      list.complete_task(0)
    end
  end

  context "#completed_tasks" do
    it "returns an empty list if no complete tasks" do
      task.stub(:complete?) { false }
      expect(list.completed_tasks).to be_empty
    end
    it "returns a list of completed tasks" do
      task2 = double(:task2, :complete? => true)
      list.add_task(task2)
      task.stub(:complete?) { false }
      expect(list.completed_tasks).to eq([task2])
    end
  end
end
