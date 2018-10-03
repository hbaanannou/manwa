class ProAsphaltProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_asphalt_product, only: [:show, :edit, :update, :destroy]

  # GET /pro_asphalt_products
  # GET /pro_asphalt_products.json
  def index
    @q = ProAsphaltProduct.ransack(params[:q])
    @pro_asphalt_products = @q.result.order(pro_asphalt_product_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /pro_asphalt_products/1
  # GET /pro_asphalt_products/1.json
  def show
  end

  # GET /pro_asphalt_products/new
  def new
    @pro_asphalt_product = ProAsphaltProduct.new
  end

  # GET /pro_asphalt_products/1/edit
  def edit
  end

  # POST /pro_asphalt_products
  # POST /pro_asphalt_products.json
  def create
    @pro_asphalt_product = ProAsphaltProduct.new(pro_asphalt_product_params)

    respond_to do |format|
      if @pro_asphalt_product.save
        format.html { redirect_to @pro_asphalt_product, notice: 'Pro asphalt product was successfully created.' }
        format.json { render :show, status: :created, location: @pro_asphalt_product }
      else
        format.html { render :new }
        format.json { render json: @pro_asphalt_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_asphalt_products/1
  # PATCH/PUT /pro_asphalt_products/1.json
  def update
    respond_to do |format|
      if @pro_asphalt_product.update(pro_asphalt_product_params)
        format.html { redirect_to @pro_asphalt_product, notice: 'Pro asphalt product was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_asphalt_product }
      else
        format.html { render :edit }
        format.json { render json: @pro_asphalt_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_asphalt_products/1
  # DELETE /pro_asphalt_products/1.json
  def destroy
    @pro_asphalt_product.destroy
    respond_to do |format|
      format.html { redirect_to pro_asphalt_products_url, notice: 'Pro asphalt product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_asphalt_product
      @pro_asphalt_product = ProAsphaltProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_asphalt_product_params
      params.require(:pro_asphalt_product).permit(:pro_asphalt_product_name)
    end
end
