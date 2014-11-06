class StaticPagesController < ApplicationController
  before_action :require_signed_in!, :only => [:backbone]

  def home
  end

  def backbone
    render :backbone, :layout => false
  end
end
