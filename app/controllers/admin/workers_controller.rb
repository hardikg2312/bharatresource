class Admin::WorkersController < AdminController
  before_action :set_workers, only: [:show, :edit, :update, :destroy]

  def index
    @workers = Worker.all
  end

  def show
  end

  def new
    @worker = Worker.new
  end

  def edit
  end

  def create
    params[:worker][:languages].delete('') if params[:worker][:languages].present?
    @worker = Worker.new(worker_params)
    @worker.br_id = @worker.set_br_id
    respond_to do |format|
      if @worker.save
        flash[:notice] = 'Worker was successfully created.'
        format.html { redirect_to admin_worker_path(@worker) }
      else
        flash[:error] = @worker.errors.full_messages.to_sentence
        format.html { render :new }
      end
    end
  end

  def update
    params[:worker][:languages].delete('') if params[:worker][:languages].present?
    respond_to do |format|
      if @worker.update(worker_params)
        flash[:notice] = 'Worker was successfully Updated.'
        format.html { redirect_to admin_worker_path(@worker)}
      else
        flash[:error] = @worker.errors.full_messages.to_sentence
        format.html { render :edit }
      end
    end
  end

  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to admin_workers_url, notice: 'Worker was successfully destroyed.' }
    end
  end

  private
    def set_workers
      @worker = Worker.find(params[:id])
    end

    def worker_params
      params.require(:worker).permit(:name, :state_id, :region_id, :industry_id, :sub_industry_id, :dob, :gender, :photo, :address, :email, :mobile_no, :proof_docs, :photo_id_proof, :education, :special_course, :college, :address_proof_docs, :address_proof_photo, :skills, :current_status, :years_of_experience, :job_title, :job_description, :member_of_any_labor_union, :key_words, :location_of_job, :specialized_skill, :supervisors_reference, :previous_salary, :languages => [])
    end
end
