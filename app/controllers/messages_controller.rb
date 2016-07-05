class MessagesController < ApplicationController
  before_action :authenticate_user!
  def chat
    List.record_timestamps = false
    room = Room.find(params[:id])
    Pusher[room.channel].trigger('chat_event', {
      message: params[:message],
      user: current_user
    })
    @msg = Message.new
    @msg.user_id = current_user.id
    @msg.room_id = params[:id]
    @msg.project_id = params[:id]
    @msg.body = params[:message]
    @msg.save
    @msg.add_list(current_user)

    render :text => 'OK', :status => 200
  end
end
