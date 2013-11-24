class CauseCategoriesController < ApplicationController
  before_action :set_cause_category, only: [:show, :edit, :update, :destroy]

  # GET /cause_categories
  # GET /cause_categories.json
  def index
    @cause_categories = CauseCategory.all
  end

  # GET /cause_categories/1
  # GET /cause_categories/1.json
  def show
  end

  # GET /cause_categories/new
  def new
    @cause_category = CauseCategory.new
  end

  # GET /cause_categories/1/edit
  def edit
  end

  # POST /cause_categories
  # POST /cause_categories.json
  def create
    @cause_category = CauseCategory.new(cause_category_params)

    respond_to do |format|
      if @cause_category.save
        format.html { redirect_to @cause_category, notice: 'Cause category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cause_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @cause_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cause_categories/1
  # PATCH/PUT /cause_categories/1.json
  def update
    respond_to do |format|
      if @cause_category.update(cause_category_params)
        format.html { redirect_to @cause_category, notice: 'Cause category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cause_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cause_categories/1
  # DELETE /cause_categories/1.json
  def destroy
    @cause_category.destroy
    respond_to do |format|
      format.html { redirect_to cause_categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cause_category
      @cause_category = CauseCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cause_category_params
      params.require(:cause_category).permit(:category_name, :description)
    end
end
