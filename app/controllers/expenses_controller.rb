class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :set_claim
  # GET /expenses
  # GET /expenses.json
  def index
    if params[:claim_id]
      Rails.logger.debug("atas")
    @expenses = @claim.expenses.all
    else
            Rails.logger.debug("bawah")

    @expenses = Expense.all
    end 
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    if params[:claim_id]
      @expense = @claim.expenses.build
    else
      @expense = Expense.new
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /expenses/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /expenses
  # POST /expenses.json
  def create
    if params[:claim_id]
      @expense = @claim.expenses.build(expense_params)
    else
      @expense = Expense.new(expense_params)
    end
      @expense.save
    # respond_to do |format|
    #   if @expense.update(expense_params)
    #     format.html { redirect_to @expense.claim, notice: 'Expense was successfully created.' }
    #     format.json { render :show, status: :ok, location: @expense }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @expense.errors, status: :unprocessable_entity }
    #   end
    # end
   
   respond_with_save(@expense)
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    @expense.update(expense_params)
    respond_with_save(@expense)
  
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to_destroy(@expense)
    # respond_to do |format|
    #   format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def set_claim
      if params[:claim_id]
          @claim = Claim.find(params[:claim_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:expense_date, :expense_value, :description, :expense_type, :file, :claim_id)
    end
end
