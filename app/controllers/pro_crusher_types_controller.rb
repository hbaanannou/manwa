class ProCrusherTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_crusher_type, only: [:show, :edit, :update, :destroy]

  # GET /pro_crusher_types
  # GET /pro_crusher_types.json
  def index
    @q = ProCrusherType.ransack(params[:q])
    @pro_crusher_types = @q.result.order(pro_crusher_type_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /pro_crusher_types/1
  # GET /pro_crusher_types/1.json
  def show
  end

  # GET /pro_crusher_types/new
  def new
    @pro_crusher_type = ProCrusherType.new
  end

  # GET /pro_crusher_types/1/edit
  def edit
  end

  # POST /pro_crusher_types
  # POST /pro_crusher_types.json
  def create
    @pro_crusher_type = ProCrusherType.new(pro_crusher_type_params)

    respond_to do |format|
      if @pro_crusher_type.save
        format.html { redirect_to @pro_crusher_type, notice: 'Pro crusher type was successfully created.' }
        format.json { render :show, status: :created, location: @pro_crusher_type }
      else
        format.html { render :new }
        format.json { render json: @pro_crusher_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_crusher_types/1
  # PATCH/PUT /pro_crusher_types/1.json
  def update
    respond_to do |format|
      if @pro_crusher_type.update(pro_crusher_type_params)
        format.html { redirect_to @pro_crusher_type, notice: 'Pro crusher type was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_crusher_type }
      else
        format.html { render :edit }
        format.json { render json: @pro_crusher_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_crusher_types/1
  # DELETE /pro_crusher_types/1.json
  def destroy
    @pro_crusher_type.destroy
    respond_to do |format|
      format.html { redirect_to pro_crusher_types_url, notice: 'Pro crusher type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_crusher_type
      @pro_crusher_type = ProCrusherType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_crusher_type_params
      params.require(:pro_crusher_type).permit(:pro_crusher_type_name)
    end
end
