class StaticPagesController < ApplicationController
  def home
  end

  def backbone
    render :backbone, :layout => false
  end
end
