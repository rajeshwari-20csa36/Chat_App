class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @recipient = User.find(params[:id])
    @messages = Message.where(sender: current_user, receiver: @recipient).or(Message.where(sender: @recipient, receiver: current_user))
    @message = Message.new

  end

  def search
    @searched_user = User.find_by(email: params[:email])

    if @searched_user
      @sender_messages = current_user.sent_messages.where(receiver: @searched_user)
      @receiver_messages = @searched_user.sent_messages.where(receiver: current_user)
    else
      flash[:alert] = 'User not found.'
      redirect_to users_path
    end
  end



end
