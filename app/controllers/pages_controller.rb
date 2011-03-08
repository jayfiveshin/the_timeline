class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @event = Event.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end #of home

  def contact
    @title = "Contact"
  end #of contact

  def about
    @title = "About"
  end #of about

  def help
    @title = "Help"
  end #of help
end #of PagesController
