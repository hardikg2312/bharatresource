class Admin::IndustriesController < AdminController
  before_action :set_industry, only: [:show, :edit, :update, :destroy]

  def index
    @industries = Industry.all
  end

  def show
  end

  def new
    @industry = Industry.new
  end

  def edit
  end

  def create
    @industry = Industry.new(industry_params)
    respond_to do |format|
      if @industry.save
        format.html { redirect_to admin_industry_path(@industry), notice: 'Industry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @industry.update(industry_params)
        format.html { redirect_to admin_industry_path(@industry), notice: 'Industry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @industry.destroy
    respond_to do |format|
      format.html { redirect_to admin_industries_url, notice: 'Industry was successfully destroyed.' }
    end
  end

  private
    def set_industry
      @industry = Industry.find(params[:id])
    end

    def industry_params
      params.require(:industry).permit(:name)
    end
end
