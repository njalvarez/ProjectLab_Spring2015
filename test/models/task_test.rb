require 'test_helper'


class TaskTest < ActiveSupport::TestCase
  def setup
    @task = tasks(:one)
  end

  test "due_date should be in the future" do
    @task.due_date = Time.now + 2.minutes
    assert @task.valid?
  end

  test "due_date should not be in the past" do
    @task.due_date = Time.now - 2.minutes
    assert_not @task.valid?
  end

  test "Task fields shouldn't be able to be blank" do
    @task.name = " "
    @task.description = " "
    assert_not @task.valid?
  end

end
