class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  require 'carmen'
  include Carmen
  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
    @recurrenceOptions = Donation::RecurrenceOptions
    @cause = Cause.find(params[:cause_id])

    #Create list of countries and states for select fields in view
    @allCountires = Country.all
    unitedStates = Country.named('United States')
    @statesUS = unitedStates.subregions    
    
    #Handle years and months for select tag in view
    @expirationMonths = []
    (1..12).each {|m| @expirationMonths << Date::MONTHNAMES[m]}  
    startYear = Time.now.year
    endYear = startYear + 10    
    @expirationYears = []
    (startYear..endYear).each {|y| @expirationYears << y}         

  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    month = Date::MONTHNAMES.index(params[:expiration_date_month])
    expirationDate = Date.new(params[:expiration_date_year].to_i, month, 1)
    paymentMethodParams = {
      :expiration_date => expirationDate,
      :name_on_card => params[:name_on_card],
      :security_code => params[:security_code]     
    }
    paymentMethod = PaymentMethod.create(paymentMethodParams)
    paymentMethod.save

    billingAddressParams = {
      :address1 => params[:address1], 
      :address2 => params[:address2], 
      :city => params[:city], 
      :state => params[:state], 
      :zip => params[:zip]
    }
    billingAddress = BillingAddress.new(billingAddressParams)
    billingAddress.save

    paymentMethod.billing_address_id = billingAddress.id

    @donation.payment_method_id = paymentMethod.id

    #Don't set from view, set to now!
    @donation.donation_date = DateTime.now()

    respond_to do |format|
      if @donation.save
        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @donation }
      else
        format.html { render action: 'new' }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:donator_id, :donation_amount, :donation_date, :recurring, :recurring_period_months, :payment_method_id)
    end
end
