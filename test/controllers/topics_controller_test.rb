require 'test_helper'

class TopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic = topics(:topic_1)
    @topic_new_param = { topic: { title: "ttt", description: "ddd" } }
  end


  test "success / index" do
    get topics_path
    assert_response 200
  end

  test "success / show" do
    get topic_path(@topic)
    assert_response 200
  end


  test "should redirect new when not logged in" do
    get new_topic_path
    assert_redirected_to login_url
  end

  test "success / new" do
    log_in_as(users(:michael))
    get new_topic_path
    assert_response 200
  end

  test "should redirect create when not logged in" do
    post topics_path, params: @topic_new_param
    assert_redirected_to login_url
  end

  test "success / create" do
    log_in_as(users(:michael))
    post topics_path, params: @topic_new_param
    assert_response 302
  end
end
