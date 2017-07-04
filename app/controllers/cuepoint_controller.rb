class CuepointController < ApplicationController
  
  def index
    @cuepoints = Cuepoint.all
  end

  def new
    @cuepoint = Cuepoint.new
  end

  def create
    @cuepoint = Cuepoint.new(cuepoint_params)
    @cuepoints = Cuepoint.all
    if @cuepoint.save
      flash[:success] = '登録に成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def edit
    @cuepoint = Cuepoint.find(params[:id])
    #@campaign = Campaign.find(@cuepoint)
  end

  def update
    @cuepoint = Cuepoint.find(params[:id])
    
    if @cuepoint.update(cuepoint_params)
      flash[:success] = '正常に更新されました。'
      redirect_to root_url
    else
      flash.now[:danger] = '更新されませんでした。'
      render :edit
    end
  end
  
  def destroy
    @cuepoint = Cuepoint.find(params[:id])
    @cuepoint.destroy
    flash[:success] = '正常に削除されました。'
    redirect_to root_url
  end
  
  private
  
  def cuepoint_params
    params.require(:cuepoint).permit(:name)
  end
end

