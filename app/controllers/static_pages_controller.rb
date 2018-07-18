class StaticPagesController < ApplicationController
  def home
    return unless logged_in?
    @micropost  = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page],
      per_page: Settings.MICROPOST_PER_PAGE)
  end

  def help; end

  def about
    @about = t ".about_message"
  end

  def contact; end
end
