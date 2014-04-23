class CorrelationsController < ApplicationController
  # GET /correlations
  # GET /correlations.json
  def index
    @correlations = Correlation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @correlations }
    end
  end

  # GET /correlations/1
  # GET /correlations/1.json
  def show
    @correlation = Correlation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @correlation }
    end
  end

  # GET /correlations/new
  # GET /correlations/new.json
  def new
    @correlation = Correlation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @correlation }
    end
  end

  # GET /correlations/1/edit
  def edit
    @correlation = Correlation.find(params[:id])
  end

  def fordigitaldata
    @correlations = DigitalDatum.find(params[:id])
    @correlations = @correlations.correlations
  end

  # POST /correlations
  # POST /correlations.json
  def create
    @correlation = Correlation.new(params[:correlation])

    respond_to do |format|
      if @correlation.save
        format.html { redirect_to @correlation, notice: 'Correlation was successfully created.' }
        format.json { render json: @correlation, status: :created, location: @correlation }
      else
        format.html { render action: "new" }
        format.json { render json: @correlation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /correlations/1
  # PUT /correlations/1.json
  def update
    @correlation = Correlation.find(params[:id])

    respond_to do |format|
      if @correlation.update_attributes(params[:correlation])
        format.html { redirect_to @correlation, notice: 'Correlation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @correlation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /correlations/1
  # DELETE /correlations/1.json
  def destroy
    @correlation = Correlation.find(params[:id])
    @correlation.destroy

    respond_to do |format|
      format.html { redirect_to correlations_url }
      format.json { head :no_content }
    end
  end
end
