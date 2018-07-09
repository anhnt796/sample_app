class StaticPagesController < ApplicationController
  def home; end

  def help; end

  def about
    @about = "Ruby on Rails, Framgia Laboratory."
  end
end
