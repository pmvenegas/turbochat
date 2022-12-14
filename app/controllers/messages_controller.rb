class MessagesController < ApplicationController
  before_action :set_message, only: %i(show edit update destroy)

  def index
    @messages = Message.all
    @message = Message.new
  end

  # def edit
  # end

  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to action: 'index' }
        format.json { render :show, status: :created, location: @message }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@message,
                                                    partial: 'messages/form',
                                                    locals: { message: @message })
        end
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @message.update(message_params)
  #       format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
  #       format.json { render :show, status: :ok, location: @message }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
