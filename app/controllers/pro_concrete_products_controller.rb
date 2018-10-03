class ProConcreteProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pro_concrete_product, only: [:show, :edit, :update, :destroy]

  # GET /pro_concrete_products
  # GET /pro_concrete_products.json
  def index
    @q = ProConcreteProduct.ransack(params[:q])
    @pro_concrete_products = @q.result.order(pro_concrete_product_name: :asc).paginate(:page => params[:page], :per_page => 20)
  end

  # GET /pro_concrete_products/1
  # GET /pro_concrete_products/1.json
  def show
  end

  # GET /pro_concrete_products/new
  def new
    @pro_concrete_product = ProConcreteProduct.new
  end

  # GET /pro_concrete_products/1/edit
  def edit
  end

  # POST /pro_concrete_products
  # POST /pro_concrete_products.json
  def create
    @pro_concrete_product = ProConcreteProduct.new(pro_concrete_product_params)

    respond_to do |format|
      if @pro_concrete_product.save
        format.html { redirect_to @pro_concrete_product, notice: 'Pro concrete product was successfully created.' }
        format.json { render :show, status: :created, location: @pro_concrete_product }
      else
        format.html { render :new }
        format.json { render json: @pro_concrete_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pro_concrete_products/1
  # PATCH/PUT /pro_concrete_products/1.json
  def update
    respond_to do |format|
      if @pro_concrete_product.update(pro_concrete_product_params)
        format.html { redirect_to @pro_concrete_product, notice: 'Pro concrete product was successfully updated.' }
        format.json { render :show, status: :ok, location: @pro_concrete_product }
      else
        format.html { render :edit }
        format.json { render json: @pro_concrete_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pro_concrete_products/1
  # DELETE /pro_concrete_products/1.json
  def destroy
    @pro_concrete_product.destroy
    respond_to do |format|
      format.html { redirect_to pro_concrete_products_url, notice: 'Pro concrete product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_concrete_product
      @pro_concrete_product = ProConcreteProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pro_concrete_product_params
      params.require(:pro_concrete_product).permit(:pro_concrete_product_name)
    end
end
