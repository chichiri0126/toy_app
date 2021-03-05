class UserThreadsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :correct_user,   only: [:new, :create]


  # get / thread list
  def list
    @title = "Threads"
    @threads = UserThread.all
    render 'list'
  end

  # get / a target thread
  def get
    @title = "Thread"
    @user |= User.find(params[:user_id])
    @thread = UserThread.find(params[:thread_id])
    @comments = UserComment.where(user_thread_id: params[:thread_id]).sort_by{ |e| e.commented_at }
    @comment = UserComment.new user_thread_id:params[:thread_id]
    render 'thread'
  end

  # form / create thread
  def new
    @title = "Create Thread"
    @thread = UserThread.new
    render 'new'
  end

  # exec / create thread
  def create
    @thread = UserThread.new(thread_params)
    if @thread.save
      flash[:success] = "Success for create thread."
      redirect_to thread_get_path(user_id: @thread.user_id, thread_id: @thread.user_id)
    else
      render 'new'
    end
  end


  private

  # validate user
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def thread_params
    params.require(:user_thread).permit(:title, :description).merge(user_id: params[:user_id])
  end
end
