class WorkersController < ApplicationController

  def index
    # @workers = Worker.limit(5)
    @workers = Worker.where('state_id = ? and region_id = ? and industry_id = ? and sub_industry_id = ?', params[:state_id], params[:region_id], params[:industry_id], params[:sub_industry_id])
  end

  def show
    @worker = Worker.find_by_id(params[:id])
  end

  def search
  end

end