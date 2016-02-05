class Admin::StatesController < AdminController

  def index
    @states = State.all
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:notice] = 'State successfully created.'
      redirect_to admin_states_path
    else
      flash[:error] = 'State not created.'
      render :new
    end
  end

  def edit
    @state = State.find_by_id(params[:id])
  end

  def update
    @state = State.find_by_id(params[:id])
    if @state.update_attributes(state_params)
      flash[:notice] = 'State successfully Updated.'
    else
      flash[:error] = 'State not created.'
    end
    redirect_to admin_states_path
  end

  def destroy
    @state = State.find_by_id(params[:id])
    @state.destroy
    redirect_to admin_states_path
  end

  private
    def state_params
      params.require(:state).permit(:name, :name_attr)
    end

end
