class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
    end
    
  def create
    @message = Message.new(message_params)
    if @message.save
    redirect_to root_path , notice: 'メッセージを保存しました'
    else
      #メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "ちょ、ちょっと！メッセージが短かすぎです！"
      render 'index'
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
end
