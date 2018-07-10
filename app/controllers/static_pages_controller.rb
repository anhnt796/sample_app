class StaticPagesController < ApplicationController
  def home; end

  def help; end

  def about
    @about = t ".about_message"
  end

  def contact; end
end
