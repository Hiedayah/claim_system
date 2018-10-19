class ClaimsController < ApplicationController
  before_action :set_claim, except: [:index, :new, :create]
  respond_to :html, :json
  # GET /claims
  # GET /claims.json
  def index
        Rails.logger.debug("ADMIN TRUE ==> #{params[:admin_claim]}")
        query_array = []

        if current_staff.admin_view?

          if params[:month] && params[:month] != "0"
            query_array.push("strftime('%m', claims.created_at) = '#{params[:month]}'")
          end
          if params[:year] && params[:year] != "0"
            query_array.push("strftime('%Y' , claims.created_at) = '#{params[:year]}'")
          end
          Rails.logger.debug("QUERY ARRAY#{query_array}")
          @claims = Claim.joins(:staff).where(staffs: {company: params[:section]}).where.not(aasm_state: "draft").where(query_array.join(" and "))
         
        else
            @claims = current_staff.claims.where(query_array.join(" and "))
        end

    respond_with(@claims)
  end

  # GET /claims/1
  # GET /claims/1.json
  def show
    respond_with(@claim)
  end

  # GET /claims/new
  def new
    @claim = Claim.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /claims/1/edit
  def edit
    allowed_to? :allow_update?, @claim, with: ClaimPolicy
    respond_to do |format|
      format.html
      format.js
    end
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
        format.js {render :save, locals: {object: @claim}}
        format.json { render json: @claim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /claims/1
  # PATCH/PUT /claims/1.json
  def update
    allowed_to? :allow_update?, @claim, with: ClaimPolicy
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
        render pdf: "print_claim", template: 'claims/print_claim', orientation: 'Landscape',viewport_size: 'TEXT', page_size: 'A4', layout: 'pdf', footer: { left: '[page] of [topage]'}   # Excluding ".pdf" extension.
      end
    end
end

['submit', 'approve','verify', 'return_by_verifier', 'return_by_approver'].each do |method|
  define_method "#{method}" do
    authorize! @claim, with: ClaimPolicy
    save_claim if params[:claim].present?
    if @claim.send("#{method}!")
      redirect_to request.referrer || @claim, notice: "Claim has been #{method.humanize}!"
    else
      redirect_to request.referrer || @claim, alert: "Failed to #{method}!"
    end
  end
end

def save_claim
  @claim.assign_attributes(claim_params)
  @claim.save
end

  # DELETE /claims/1
  # DELETE /claims/1.json
  def destroy
    allowed_to? :allow_update?, @claim, with: ClaimPolicy
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
      params.require(:claim).permit(
        :date, :status, :verifier_id, :approver_id, :staff_id, :aasm_state,
        justification_attributes: [:id, :approver_message, :staff_message, :verifier_message])
    end

end
