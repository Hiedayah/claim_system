class ClaimsController < ApplicationController
  before_action :set_claim, except: [:index]
  respond_to :html, :json
  # GET /claims
  # GET /claims.json
  def index
    #@claims = Claim.all
     if current_staff.admin?
        @claims = Claim.joins(:staff).where(staffs: {company: params[:section]}).where.not(aasm_state: "submitted")
     else
        @claims = current_staff.claims
     end

    # if current_staff.admin?
    #   @claims_localhost = Claim.joins(:staff).where(staffs: {company: 'Localhost'})
    #   @claims_dnsv = Claim.joins(:staff).where(staffs: {company: 'Dnsvault'})
    # else
    #   @claims = Claim.where(staff_id: current_staff.id)
    # end

    respond_with(@claims)
  end

  # GET /claims/1
  # GET /claims/1.json
  def show
  end

  # GET /claims/new
  def new
    @claim = Claim.new
  end

  # GET /claims/1/edit
  def edit
  end

  # POST /claims
  # POST /claims.json
  def create
    @claim = Claim.new(claim_params)

    respond_to do |format|
      if @claim.save
        format.html { redirect_to @claim, notice: 'Claim was successfully created.' }
        format.json { render :show, status: :created, location: @claim }
      else
        format.html { render :new }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1
  # PATCH/PUT /claims/1.json
  def update
    respond_to do |format|
      if @claim.update(claim_params)
        format.html { redirect_to @claim, notice: 'Claim was successfully updated.' }
        format.json { render :show, status: :ok, location: @claim }
      else
        format.html { render :edit }
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

def print_claim
    @expense_entries = @claim.expenses
    respond_to do |format|
      format.html { render layout: 'pdf' }
      format.pdf do
        render pdf: "print_claim", template: 'claims/print_claim', layout: 'pdf', footer: { left: '[page] of [topage]'}   # Excluding ".pdf" extension.
      end
    end
end

['submit', 'approve','verify'].each do |method|
  define_method "#{method}" do
    if @claim.send("#{method}!")
      redirect_to @claim, notice: "#{method}!"
    else
      redirect_to @claim, alert: "Failed to #{method}!"
    end
  end
end

  # DELETE /claims/1
  # DELETE /claims/1.json
  def destroy
    @claim.destroy
    respond_to do |format|
      format.html { redirect_to claims_url, notice: 'Claim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_claim
      @claim = Claim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def claim_params
      params.require(:claim).permit(:date, :status, :verifier_id, :approver_id, :staff_id, :aasm_state)
    end
end
