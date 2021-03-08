require 'test_helper'

class TopicCommentTest < ActiveSupport::TestCase
  def setup
    @user_michael = users(:michael)
    @user_archer = users(:archer)
    @user_lana = users(:lana)
    @topic1 = topics(:topic_1)
    @topic_comment = TopicComment.new(
        user_id:@user_michael.id,
        topic_id:@topic1.id,
        body:"body_test",
        commented_at:Time.zone.now
      )
  end

  test "should be valid" do
    assert @topic_comment.valid?
  end

  test "body should be present" do
    @topic_comment.body = "     "
    assert_not @topic_comment.valid?
  end

  test "body should not be too long" do
    @topic_comment.body = "a" * 1001
    assert_not @topic_comment.valid?
  end

  test "user_id should be present" do
    @topic_comment.user_id = "     "
    assert_not @topic_comment.valid?
  end

  test "user_id should be relation" do
    @topic_comment.user_id = "999999999"
    assert_not @topic_comment.valid?
  end

  test "topic_id should be present" do
    @topic_comment.topic_id = "     "
    assert_not @topic_comment.valid?
  end

  test "topic_id should be relation" do
    @topic_comment.topic_id = "999999999"
    assert_not @topic_comment.valid?
  end

  test "commented_at should be present" do
    @topic_comment.commented_at = "     "
    assert_not @topic_comment.valid?
  end

  test "only topic/comment owner can delete" do
    assert @topic_comment.deletable? @user_michael
    assert @topic_comment.deletable? @user_archer
    assert_not @topic_comment.deletable? @user_lana
  end

end
