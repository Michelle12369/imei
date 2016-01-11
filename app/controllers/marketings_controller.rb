class MarketingsController < ApplicationController
  before_action :set_marketing, only: [:show, :edit, :update, :destroy]

  # GET /marketings
  # GET /marketings.json
  def index
     @marketings = Marketing.where.not(id:1)
  end

  # GET /marketings/1
  # GET /marketings/1.json
  def show
  end
def input
    week=[]
    for i in (0..7)
      week=week+[Date.today+i]
    end
    array=Retailer.where(:valid_date=>week).where("number_bought-number_sold>0")
marketings=Marketing.all
#更新一比促銷資料
    
 for i in array
      for j in marketings
        if i.id.to_s===j.retail_id
          a=Marketing.find_by(retail_id: i.id.to_s)
          a.r_inventory=i.number_bought-i.number_sold
          a.valid_date=i.valid_date
          a.save
          #flash[:notice]="成功更新有效日期#{a.valid_date}、商品編號#{a.p_id}的#{a.p_name}資料~~"
        else
          @marketing = Marketing.new
          overinform=Retailinform.find_by(p_id: i.p_id)
          @marketing.p_id=i.p_id
          @marketing.p_name=i.p_name
          @marketing.price_origin=overinform.price
          @marketing.r_inventory=i.number_bought-i.number_sold
          @marketing.valid_date=i.valid_date
          @marketing.retail_id=i.id.to_s
          @marketing.profit=0.0
          @marketing.increase=0.0
          @marketing.price=0.0
          @marketing.save
          puts"yesyes"
          #flash[:notice]="匯入有效日期為#{@marketing.valid_date}的#{@marketing.p_name}資料成功!!"

        end
      end
    end
   
#更新結束

#若更新後日期不符合七週內則從marketing踢除
    candidates=Retailer.where.not(valid_date:week)
    for i in candidates
      for j in marketings
        if i.id.to_s===j.retail_id
          j.destroy
          #flash[:notice]="成功更新資料~~"
        end
      end
    end 
    
  redirect_to marketings_url
  end

def redirt
  redirect_to marketings_url

end
  # GET /marketings/new
  def new
    @marketing = Marketing.new
  end

  # GET /marketings/1/edit
  def edit
  end

  # POST /marketings
  # POST /marketings.json
  def create
    @marketing = Marketing.new(marketing_params)

    respond_to do |format|
      if @marketing.save
        format.html { redirect_to @marketing, notice: 'Marketing was successfully created.' }
        format.json { render :show, status: :created, location: @marketing }
      else
        format.html { render :new }
        format.json { render json: @marketing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marketings/1
  # PATCH/PUT /marketings/1.json
  def update
    
    @marketing = Marketing.find(params[:id])

    @marketing.update(marketing_params)
        retail=Retailinform.find_by(p_id: @marketing.p_id)
        @marketing.profit=(((retail.price.to_f-retail.cost.to_f)/retail.price.to_f)*100).round(2)
        p=(@marketing.increase/100.0)*(@marketing.profit/100)/(1+@marketing.increase/100.0)
        @marketing.price=(1.0-p)*@marketing.price_origin
       @marketing.price=@marketing.price.round(2)
        @marketing.save

    #@marketing.changed
    #@marketing.changes

    respond_to do |format|
        
       format.html { redirect_to marketings_url, notice: 'Marketing was successfully updated.' }
        format.json { render :json => { :status => "ok" }}#{ render json: {status: "ok"}}

        
      
       
       
     # else
      #  format.html { render :edit }
     #   format.json { render_with_bip(@marketing)}#render json: @marketing.errors, status: :unprocessable_entity }
     # end
    end
    # redirect_to 
  end

  # DELETE /marketings/1
  # DELETE /marketings/1.json
  def destroy
    @marketing.destroy
    respond_to do |format|
      format.html { redirect_to marketings_url, notice: 'Marketing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marketing
      @marketing = Marketing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marketing_params
      params.require(:marketing).permit(:p_id, :p_name, :r_inventory, :price, :price_origin, :increase, :profit, :valid_date, :retail_id)
    end
end
