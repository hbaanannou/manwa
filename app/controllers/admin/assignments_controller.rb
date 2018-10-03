module Admin
class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  # GET /assignments
  def index
    @q = Admin::Assignment.ransack(params[:q])
    @assignments = @q.result.order(id: :asc).paginate(:page => params[:page], :per_page => 20)
    authorize @assignments    
  end

  # GET /assignments/1
  def show
    authorize @assignment
  end

  # GET /assignments/new
  def new
    @assignment = Admin::Assignment.new
    authorize @assignment
  end

  # GET /assignments/1/edit
  def edit
    authorize @assignment
  end

  # POST /assignments
  def create
    @assignment = Admin::Assignment.new(assignment_params)
    authorize @assignment

    if @assignment.save
      redirect_to @assignment, notice: 'Assignment was successfully created.'
    else
      render :new
    end


rescue ActiveRecord::RecordNotUnique => e
  if e.is_a?(ActiveRecord::RecordNotUnique) && e.cause.message.match('unique constraint "index_assignments_on_user_id_and_role_id"')
    flash[:alert] = "This user has the same role."
    render :new
  else
    # not something we expected
    raise
  end



  end


  # PATCH/PUT /assignments/1
  def update
    authorize @assignment
    if @assignment.update(assignment_params)
      redirect_to @assignment, notice: 'Assignment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assignments/1
  def destroy
    authorize @assignment
    @assignment.destroy
    redirect_to admin_assignments_url, notice: 'Assignment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Admin::Assignment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def assignment_params
      params.require(:admin_assignment).permit(:user_id, :role_id, :employee_id)
    end
end
end
