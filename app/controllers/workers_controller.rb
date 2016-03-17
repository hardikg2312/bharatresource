class WorkersController < ApplicationController

  def index
    @workers = Worker.where('state_id = ? and region_id = ? and industry_id = ? and sub_industry_id = ? and years_of_experience = ?', params[:state_id], params[:region_id], params[:industry_id], params[:sub_industry_id], params[:years_of_experience])
  end

  def show
    @worker = Worker.includes(:references).find_by_id(params[:id])
  end

  def search
  end

end