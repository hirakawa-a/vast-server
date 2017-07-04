class ResultsController < ApplicationController
  def index
    @results = Result.all.order(cuepoint_id: :desc)
  end
  
  
  def record
    @campaign = Campaign.find(params[:campaign])
    @cuepoint = Cuepoint.find(params[:cuepoint])
    @result = Result.find_or_initialize_by(campaign: @campaign, cuepoint: @cuepoint)
    
    @result.count_start = 0 if @result.count_start.nil?
    @result.count_end = 0 if @result.count_end.nil?
    logger.debug @result.inspect
    if params[:event] == 'start'
      @result.count_start += 1
    elsif params[:event] == 'complete'
      @result.count_end += 1
    end
    
    @result.save!

    send_data(Base64.decode64('R0lGODlhAQABAPAAAAAAAAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='),
type: 'image/gif', disposition: 'inline')
  end
end
