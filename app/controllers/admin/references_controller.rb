class Admin::ReferencesController < AdminController
  before_action :set_workers

  def index
    @references = @worker.references
  end

  def new
    @reference = @worker.references.build
  end

  def create
    @reference = @worker.references.build(reference_params)
    if @reference.save
      flash[:notice] = 'Reference successfully created.'
    else
      flash[:error] = @reference.errors.full_messages.to_sentence
    end
    redirect_to admin_worker_references_path(@worker)
  end

  def edit
    @reference = @worker.references.find(params[:id])
  end

  def update
    @reference = @worker.references.find(params[:id])
    if @reference.update_attributes(reference_params)
      flash[:notice] = 'Reference successfully updated.'
    else
      flash[:error] = @reference.errors.full_messages.to_sentence
    end
    redirect_to admin_worker_references_path(@worker)
  end

  def destroy
    @reference = @worker.references.find(params[:id])
    @reference.destroy
    redirect_to admin_worker_references_path(@worker)
  end


  private
    def set_workers
      @worker = Worker.find(params[:worker_id])
    end

    def reference_params
      params.require(:reference).permit(:name, :mobile_no, :email)
    end
end