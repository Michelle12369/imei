class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show, :edit, :update, :destroy]

  # GET /retailers
  # GET /retailers.json
  def index
    @retailers = Retailer.all
    @retailinforms =Retailinform.all
  end

  # GET /retailers/1
  # GET /retailers/1.json
  def show
  end

  # GET /retailers/new
  def new
    @retailer = Retailer.new
  end

  # GET /retailers/1/edit
  def edit
  end

  # POST /retailers
  # POST /retailers.json
  def create
    retailers_u="/retailers/new"
    @retailer = Retailer.new(retailer_params)
    @retailer.temp=@retailer.number_bought-@retailer.number_sold
    @retailer.save
    a=Retailinform.find_by(p_id: @retailer.p_id)
    if a==nil
      @retailer.destroy
      redirect_to retailers_u
      flash[:notice]="請先至門市基本資料新增一筆基本資料再回來新增庫存資料，或輸入已經存在的商品"
    else
      a.r_inventory=a.r_inventory+@retailer.temp
      a.save
      redirect_to @retailer
    end

  end

  # PATCH/PUT /retailers/1
  # PATCH/PUT /retailers/1.json
   def update
   # respond_to do |format|
   retailers_u="/retailers/new"
   k=@retailer.p_id_was
      b=@retailer.number_bought-@retailer.number_sold
        @retailer.update(retailer_params)
        @retailer.temp=@retailer.number_bought-@retailer.number_sold
      a=Retailinform.find_by(p_id: @retailer.p_id)
    if a==nil
      @retailer.p_id=k
      @retailer.save
      redirect_to @retailer
      flash[:notice]="更新無效，請先至門市基本資料新增一筆基本資料再回來更改庫存資料，或輸入已經存在的商品"
    else
      a.r_inventory=a.r_inventory+@retailer.temp-b
      a.save
      redirect_to @retailer

    end

    #  else
    #    format.html { render :edit }
    #    format.json { render json: @retailer.errors, status: :unprocessable_entity }
    #  end
   # end
  end

  # DELETE /retailers/1
  # DELETE /retailers/1.json
  def destroy
    b=@retailer.number_bought-@retailer.number_sold
    a=Retailinform.find_by(p_id: @retailer.p_id)
    a.r_inventory=a.r_inventory-b
    a.save
    @retailer.destroy
    respond_to do |format|
      format.html { redirect_to retailers_url, notice: 'Retailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retailer_params
      params.require(:retailer).permit(:p_id, :p_name, :number_sold, :number_bought, :valid_date, :temp)
    end
end
