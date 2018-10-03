class ProConcreteTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_concrete_type, only: [:show, :edit, :update, :destroy]

  # GET /pro_concrete_types
  # GET /pro_concrete_types.json
  def index
    @q = ProConcreteType.ransack(params[:q])
    @pro_concrete_types = @q.result.order(pro_concrete_type_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /pro_concrete_types/1
  # GET /pro_concrete_types/1.json
  def show
  end

  # GET /pro_concrete_types/new
  def new
    @pro_concrete_type = ProConcreteType.new
  end

  # GET /pro_concrete_types/1/edit
  def edit
  end

  # POST /pro_concrete_types
  # POST /pro_concrete_types.json
  def create
    @pro_concrete_type = ProConcreteType.new(pro_concrete_type_params)

    respond_to do |format|
      if @pro_concrete_type.save
        format.html { redirect_to @pro_concrete_type, notice: 'Pro concrete type was successfully created.' }
        format.json { render :show, status: :created, location: @pro_concrete_type }
      else
        format.html { render :new }
        format.json { render json: @pro_concrete_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_concrete_types/1
  # PATCH/PUT /pro_concrete_types/1.json
  def update
    respond_to do |format|
      if @pro_concrete_type.update(pro_concrete_type_params)
        format.html { redirect_to @pro_concrete_type, notice: 'Pro concrete type was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_concrete_type }
      else
        format.html { render :edit }
        format.json { render json: @pro_concrete_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_concrete_types/1
  # DELETE /pro_concrete_types/1.json
  def destroy
    @pro_concrete_type.destroy
    respond_to do |format|
      format.html { redirect_to pro_concrete_types_url, notice: 'Pro concrete type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_concrete_type
      @pro_concrete_type = ProConcreteType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_concrete_type_params
      params.require(:pro_concrete_type).permit(:pro_concrete_type_name)
    end
end
