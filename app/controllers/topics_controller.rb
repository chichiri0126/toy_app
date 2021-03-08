class TopicsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]


  def index
    @title = "Topics"
    @topics = Topic.all
  end

  def show
    @title = "Topic"
    @topic = Topic.find(params[:id])
    @comments = @topic.topic_comments.includes(:user).order(commented_at: :desc)
    @comment = TopicComment.new(topic_id: params[:topic_id])
  end

  # form / create topic
  def new
    @title = "Create Topic"
    @topic = Topic.new
  end

  # exec / create topic
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "Success for create topic."
      redirect_to topic_path(id: @topic.id)
    else
      flash[:danger] = "failed."
      redirect_to new_topic_path
    end
  end


  private
  def topic_params
    params.require(:topic).permit(:title, :description).merge(user_id: current_user.id)
  end
end
