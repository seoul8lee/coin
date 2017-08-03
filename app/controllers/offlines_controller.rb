class OfflinesController < ApplicationController
  
  def index
  end

  def career
  end

  def coding
  end

  def career_new
  end

  def coding_new
  end
  
  def create
    @offline = Offline.new
    @offline.category = params[:category]
    @offline.team_name = params[:team_name]
    @offline.address = params[:address]
    @offline.name = params[:name]
    @offline.phone = params[:phone]
    @offline.date = params[:date]
    @offline.content = params[:content]
    @offline.save
    redirect_to "/offlines/index"
  end
  
  
end
