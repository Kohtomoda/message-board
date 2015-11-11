class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def destroy
    @message.destroy
      redirect_to root_path , notice: 'メッセージを削除しました'
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      #保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else 
      #保存に失敗した場合は編集画面へ移す
      render 'edit'
    end
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  
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
