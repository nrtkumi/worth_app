class MessagesController < WebsocketRails::BaseController
  # before_action :authenticate_user!
  def create
    msg = Message.new
    msg.user_id = current_user.id
    room = Room.find_by(channel: message["ch"])
    msg.room_id = room.id
    msg.body = message["msg"]
    msg.save
    message["user"] = current_user
    WebsocketRails[message["ch"]].trigger(:post, message)
  end
end
