class DigitalDataController < ApplicationController
  # GET /digital_data
  # GET /digital_data.json
  def index
    @digital_data = DigitalDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @digital_data }
    end
  end

  # GET /digital_data/1
  # GET /digital_data/1.json
  def show
    @digital_datum = DigitalDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @digital_datum }
    end
  end

  # GET /digital_data/new
  # GET /digital_data/new.json
  def new
    @digital_datum = DigitalDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @digital_datum }
    end
  end

  # GET /digital_data/1/edit
  def edit
    @digital_datum = DigitalDatum.find(params[:id])
  end

  # POST /digital_data
  # POST /digital_data.json
  def create
    @digital_datum = DigitalDatum.new(params[:digital_datum])

    respond_to do |format|
      if @digital_datum.save
        format.html { redirect_to @digital_datum, notice: 'Digital datum was successfully created.' }
        format.json { render json: @digital_datum, status: :created, location: @digital_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @digital_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /digital_data/1
  # PUT /digital_data/1.json
  def update
    @digital_datum = DigitalDatum.find(params[:id])

    respond_to do |format|
      if @digital_datum.update_attributes(params[:digital_datum])
        format.html { redirect_to @digital_datum, notice: 'Digital datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @digital_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digital_data/1
  # DELETE /digital_data/1.json
  def destroy
    @digital_datum = DigitalDatum.find(params[:id])
    @digital_datum.destroy

    respond_to do |format|
      format.html { redirect_to digital_data_url }
      format.json { head :no_content }
    end
  end
end
