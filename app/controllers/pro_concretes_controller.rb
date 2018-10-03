class ProConcretesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_concrete, only: [:show, :edit, :update, :destroy]

  # GET /pro_concretes
  # GET /pro_concretes.json
  def index
    @q = ProConcrete.ransack(params[:q])
    @pro_concretes = policy_scope(@q.result.order(day: :desc).paginate(:page => params[:page], :per_page => 20))
  end

  # GET /pro_concretes/1
  # GET /pro_concretes/1.json
  def show
  end

  # GET /pro_concretes/new
  def new
    @pro_concrete = ProConcrete.new

    3.times do
      @pro_concrete.pro_concrete_subs.build
    end
    
  end

  # GET /pro_concretes/1/edit
  def edit
  end

  # POST /pro_concretes
  # POST /pro_concretes.json
  def create
    @pro_concrete = ProConcrete.new(pro_concrete_params)

    respond_to do |format|
      if @pro_concrete.save
        format.html { redirect_to pro_concretes_path(@pro_concrete), notice: 'Pro concrete was successfully created.' }
        format.json { render :show, status: :created, location: @pro_concrete }
      else
        format.html { render :new }
        format.json { render json: @pro_concrete.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_concretes/1
  # PATCH/PUT /pro_concretes/1.json
  def update
    respond_to do |format|
      if @pro_concrete.update(pro_concrete_params)
        format.html { redirect_to pro_concretes_path(@pro_concrete), notice: 'Pro concrete was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_concrete }
      else
        format.html { render :edit }
        format.json { render json: @pro_concrete.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_concretes/1
  # DELETE /pro_concretes/1.json
  def destroy
    @pro_concrete.destroy
    respond_to do |format|
      format.html { redirect_to pro_concretes_url, notice: 'Pro concrete was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_concrete
      @pro_concrete = ProConcrete.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_concrete_params
      params.require(:pro_concrete).permit(:province_pro_asset_id, :day, :pro_concrete_hours, :pro_concrete_machines_num, pro_concrete_subs_attributes: ProConcreteSub.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
