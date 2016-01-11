class RetailinformsController < ApplicationController
  before_action :set_retailinform, only: [:show, :edit, :update, :destroy]

  # GET /retailinforms
  # GET /retailinforms.json
  def index
    @retailinforms = Retailinform.all
  end

  # GET /retailinforms/1
  # GET /retailinforms/1.json
  def show
  end

  # GET /retailinforms/new
  def new
    @retailinform = Retailinform.new
  end

  # GET /retailinforms/1/edit
  def edit
  end

  # POST /retailinforms
  # POST /retailinforms.json
def create
    @retailinform = Retailinform.new(retailinform_params)
    @retailinform.eoq=Math.sqrt(26*(@retailinform.max_demand.to_f+@retailinform.min_demand.to_f)*@retailinform.book_cost.to_f/@retailinform.hold_cost.to_f)
    @retailinform.rop=((@retailinform.price.to_f-@retailinform.cost.to_f)/(@retailinform.price.to_f))*(@retailinform.max_demand.to_f-@retailinform.min_demand.to_f)
    @retailinform.r_inventory=0
    respond_to do |format|
      if @retailinform.save
        format.html { redirect_to @retailinform, notice: 'Retailinform was successfully created.' }
        format.json { render :show, status: :created, location: @retailinform }
      else
        format.html { render :new }
        format.json { render json: @retailinform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /retailinforms/1
  # PATCH/PUT /retailinforms/1.json
  def update
    respond_to do |format|
      if @retailinform.update(retailinform_params)
        format.html { redirect_to @retailinform, notice: 'Retailinform was successfully updated.' }
        format.json { render :show, status: :ok, location: @retailinform }
        @retailinform.eoq=Math.sqrt(26*(@retailinform.max_demand.to_f+@retailinform.min_demand.to_f)*@retailinform.book_cost.to_f/@retailinform.hold_cost.to_f)
        @retailinform.rop=((@retailinform.price.to_f-@retailinform.cost.to_f)/(@retailinform.price.to_f))*(@retailinform.max_demand.to_f-@retailinform.min_demand.to_f)
        @retailinform.save
      else
        format.html { render :edit }
        format.json { render json: @retailinform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /retailinforms/1
  # DELETE /retailinforms/1.json
  def destroy
    @retailinform.destroy
    respond_to do |format|
      format.html { redirect_to retailinforms_url, notice: 'Retailinform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_retailinform
      @retailinform = Retailinform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def retailinform_params
      params.require(:retailinform).permit(:p_id, :max_demand, :min_demand, :r_inventory, :book_cost, :hold_cost, :cost, :price, :eoq, :rop)
    end
end
