class CampaignsController < ApplicationController
  
  def index
    unless params[:cuepoint_id]
      @campaigns = Campaign.all
    else
      @cuepoint = Cuepoint.find(params[:cuepoint_id])
      @campaigns = Campaign.current_available(@cuepoint)
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
      response.headers['Access-Control-Allow-Methods'] = 'GET'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Credentials'] = 'true'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type'
    end
  end

  def new
    @campaign = Campaign.new
    @cuepoints = Cuepoint.all
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @cuepoints = Cuepoint.all
    p cuepoint_ids = campaign_params[:cuepoint_ids].reject(&:blank?).map(&:to_i)
    if @campaign.save
      cuepoint_ids.each do |cuepoint_id|
        #中間レコードの処理
        CampaignCuepoint.create(cuepoint_id: cuepoint_id)
      end
      flash[:success] = '登録に成功しました。'
      redirect_to root_path
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
    @cuepoints = Cuepoint.all
  end

  def update
    @campaign = Campaign.find(params[:id])
    
    if @campaign.update(campaign_params)
      flash[:success] = '正常に更新されました。'
      redirect_to root_url
    else
      flash.now[:danger] = '更新されませんでした。'
      render :edit
    end
  end
  
  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    flash[:danger] = 'キャンペーンは正常に削除されました。'
    redirect_to root_url
  end
  
  private
  
  def campaign_params
    params.require(:campaign).permit(:name, :start_at, :end_at, :limit_start, :movie_url,
                                     cuepoint_ids: [])
  end
end

