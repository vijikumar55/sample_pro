class ChatController < ApplicationController
  layout 'main_menu'
  def index
    #raise params.inspect
    @chatting_with=User.find(params[:id].to_i) if params[:id]
    user_ids=[@chatting_with.id.to_i,session[:user_id].to_i]
    @chats=Chat.where(["(user_id=? and to_id=?) or (user_id=? and to_id=?)",session[:user_id].to_i,@chatting_with.id.to_i,@chatting_with.id.to_i,session[:user_id].to_i]).limit(12).order("id desc")
  end
  
  def create
    @chat = Chat.new(params[:chat].merge(:to_id=>params[:to].to_i))
    @chat.save
    redirect_to action: :index, :id=>params[:to].to_i
  end
  
  def online_users
    @user=User.where(["id !=?",session[:user_id]]).order("visited_at desc")
    #@user=User.where(["visited_at is not null and id not IN (#{session[:user_id].to_i})"]).order("id asc").select{|a|((Time.now - a.visited_at).round/60).to_f <= 10}
  end
  
end
