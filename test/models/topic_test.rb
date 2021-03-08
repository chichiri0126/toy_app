require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:michael)
    @topic = @user1.topics.build(title: "title1", description: "description1")
  end

  test "should be valid" do
    assert @topic.valid?
  end

  test "title should be present" do
    @topic.title = "     "
    assert_not @topic.valid?
  end

  test "title should not be too long" do
    @topic.title = "a" * 256
    assert_not @topic.valid?
  end

  test "description should be present" do
    @topic.description = "     "
    assert_not @topic.valid?
  end

  test "description should not be too long" do
    @topic.description = "a" * 1025
    assert_not @topic.valid?
  end

  test "user_id should be present" do
    @topic.user_id = ""
    assert_not @topic.valid?
  end
end