

class UserMessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @recipient = User.find(params[:user_id])
    @message = current_user.sent_messages.build(receiver: @recipient, content: params[:content])

    if @message.save
    else
    end

    redirect_to user_path(@recipient)
  end

end
