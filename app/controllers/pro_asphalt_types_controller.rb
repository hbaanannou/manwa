class ProAsphaltTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_asphalt_type, only: [:show, :edit, :update, :destroy]

  # GET /pro_asphalt_types
  # GET /pro_asphalt_types.json
  def index
    @q = ProAsphaltType.ransack(params[:q])
    @pro_asphalt_types = @q.result.order(pro_asphalt_type_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /pro_asphalt_types/1
  # GET /pro_asphalt_types/1.json
  def show
  end

  # GET /pro_asphalt_types/new
  def new
    @pro_asphalt_type = ProAsphaltType.new
  end

  # GET /pro_asphalt_types/1/edit
  def edit
  end

  # POST /pro_asphalt_types
  # POST /pro_asphalt_types.json
  def create
    @pro_asphalt_type = ProAsphaltType.new(pro_asphalt_type_params)

    respond_to do |format|
      if @pro_asphalt_type.save
        format.html { redirect_to @pro_asphalt_type, notice: 'Pro asphalt type was successfully created.' }
        format.json { render :show, status: :created, location: @pro_asphalt_type }
      else
        format.html { render :new }
        format.json { render json: @pro_asphalt_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_asphalt_types/1
  # PATCH/PUT /pro_asphalt_types/1.json
  def update
    respond_to do |format|
      if @pro_asphalt_type.update(pro_asphalt_type_params)
        format.html { redirect_to @pro_asphalt_type, notice: 'Pro asphalt type was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_asphalt_type }
      else
        format.html { render :edit }
        format.json { render json: @pro_asphalt_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_asphalt_types/1
  # DELETE /pro_asphalt_types/1.json
  def destroy
    @pro_asphalt_type.destroy
    respond_to do |format|
      format.html { redirect_to pro_asphalt_types_url, notice: 'Pro asphalt type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_asphalt_type
      @pro_asphalt_type = ProAsphaltType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_asphalt_type_params
      params.require(:pro_asphalt_type).permit(:pro_asphalt_type_name)
    end
end
