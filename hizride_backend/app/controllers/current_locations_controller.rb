class CurrentLocationsController < ApplicationController
  before_action :set_current_location, only: [:show, :edit, :update, :destroy]

  # GET /current_locations
  # GET /current_locations.json
  def index
    @current_locations = CurrentLocation.all
  end

  # GET /current_locations/1
  # GET /current_locations/1.json
  def show
  end

  # GET /current_locations/new
  def new
    @current_location = CurrentLocation.new
  end

  # GET /current_locations/1/edit
  def edit
  end

  # POST /current_locations
  # POST /current_locations.json
  def create
    @current_location = CurrentLocation.new(current_location_params)

    respond_to do |format|
      if @current_location.save
        format.html { redirect_to @current_location, notice: 'Current location was successfully created.' }
        format.json { render :show, status: :created, location: @current_location }
      else
        format.html { render :new }
        format.json { render json: @current_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /current_locations/1
  # PATCH/PUT /current_locations/1.json
  def update
    respond_to do |format|
      if @current_location.update(current_location_params)
        format.html { redirect_to @current_location, notice: 'Current location was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_location }
      else
        format.html { render :edit }
        format.json { render json: @current_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /current_locations/1
  # DELETE /current_locations/1.json
  def destroy
    @current_location.destroy
    respond_to do |format|
      format.html { redirect_to current_locations_url, notice: 'Current location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_location
      @current_location = CurrentLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_location_params
      params.require(:current_location).permit(:lat, :lng, :user_id)
    end
end
