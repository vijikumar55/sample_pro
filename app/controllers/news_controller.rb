class NewsController < ApplicationController
#  layout 'main_menu'
  def index
    @news=News.where(["published_date=?",Date.today]).order("id desc").limit(10)
  end
  
  def new
  end
  
  def save
    params_for_news=params[:news].merge(:published_date=>Date.today, :author_name=>Admin.find(session[:user_id]).email)
    @news=News.new(params_for_news)
    status=@news.save!
  end
  
  def view_news
    @news=News.find(params[:id])
  end
end
