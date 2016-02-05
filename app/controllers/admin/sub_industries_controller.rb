class Admin::SubIndustriesController < AdminController
  before_action :set_sub_industry, only: [:show, :edit, :update, :destroy]

  def index
    @sub_industries = SubIndustry.all
  end

  def show
  end

  def new
    @sub_industry = SubIndustry.new
  end

  def edit
  end

  def create
    @sub_industry = SubIndustry.new(sub_industry_params)
    respond_to do |format|
      if @sub_industry.save
        format.html { redirect_to admin_sub_industry_path(@sub_industry), notice: 'Sub industry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @sub_industry.update(sub_industry_params)
        format.html { redirect_to admin_sub_industry_path(@sub_industry), notice: 'Sub industry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @sub_industry.destroy
    respond_to do |format|
      format.html { redirect_to admin_sub_industries_url, notice: 'Sub industry was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_industry
      @sub_industry = SubIndustry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_industry_params
      params.require(:sub_industry).permit(:name, :industry_id)
    end
end
