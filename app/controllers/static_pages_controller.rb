class StaticPagesController < ApplicationController
  
  def home
  	@categories = Category.all
  	@advertisements = Advertisement.all
  end

  def help
  end

  def about
  end

  def contact
  end
end
