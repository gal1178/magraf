class NumericalDataController < ApplicationController
  # GET /numerical_data
  # GET /numerical_data.json
  def index
    @numerical_data = NumericalDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @numerical_data }
    end
  end

  # GET /numerical_data/1
  # GET /numerical_data/1.json
  def show
    @numerical_datum = NumericalDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @numerical_datum }
    end
  end

  # GET /numerical_data/new
  # GET /numerical_data/new.json
  def new
    @numerical_datum = NumericalDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @numerical_datum }
    end
  end

  # GET /numerical_data/1/edit
  def edit
    @numerical_datum = NumericalDatum.find(params[:id])
  end

  # POST /numerical_data
  # POST /numerical_data.json
  def create
    @numerical_datum = NumericalDatum.new(params[:numerical_datum])

    respond_to do |format|
      if @numerical_datum.save
        format.html { redirect_to @numerical_datum, notice: 'Numerical datum was successfully created.' }
        format.json { render json: @numerical_datum, status: :created, location: @numerical_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @numerical_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /numerical_data/1
  # PUT /numerical_data/1.json
  def update
    @numerical_datum = NumericalDatum.find(params[:id])

    respond_to do |format|
      if @numerical_datum.update_attributes(params[:numerical_datum])
        format.html { redirect_to @numerical_datum, notice: 'Numerical datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @numerical_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /numerical_data/1
  # DELETE /numerical_data/1.json
  def destroy
    @numerical_datum = NumericalDatum.find(params[:id])
    @numerical_datum.destroy

    respond_to do |format|
      format.html { redirect_to numerical_data_url }
      format.json { head :no_content }
    end
  end
end
