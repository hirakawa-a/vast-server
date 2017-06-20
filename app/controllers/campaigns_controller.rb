class CampaignsController < ApplicationController
  
  def index
    @campaigns = Campaign.all.page(params[:page])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
