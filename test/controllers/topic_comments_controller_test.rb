require 'test_helper'

class TopicCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic_comment = topic_comments(:topic_comment_1)
    @topic_comment_new_param = { topic_comment: { body: "bbb" } }
  end

  test "success / create" do
    log_in_as(users(:michael))
    assert_no_difference 'TopicComment.count', 1 do
      post topic_comments_path(@topic_comment), params: @topic_comment_new_param
    end
    assert_redirected_to root_url
  end

  test "failed / should redirect create when not logged in" do
    assert_no_difference 'TopicComment.count', 0 do
      post topic_comments_path(@topic_comment)
    end
    assert_redirected_to login_url
  end

  test "success / destroy" do
    log_in_as(users(:michael))
    assert_no_difference 'TopicComment.count', -1 do
      delete topic_comment_path(@topic_comment.topic_id, @topic_comment.id)
    end
    assert_redirected_to root_url
  end

  test "failed / should redirect destroy when not logged in" do
    assert_no_difference 'TopicComment.count', 0 do
      delete topic_comment_path(@topic_comment.topic_id, @topic_comment.id)
    end
    assert_redirected_to login_url
  end

  test "failed / don't owner" do
    log_in_as(users(:lana))
    assert_no_difference 'TopicComment.count', 0 do
      delete topic_comment_path(@topic_comment.topic_id, @topic_comment.id)
    end
    assert_redirected_to root_url
  end

end
