class GraphicDataController < ApplicationController
  # GET /graphic_data
  # GET /graphic_data.json
  def index
    @graphic_data = GraphicDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @graphic_data }
    end
  end

  # GET /graphic_data/1
  # GET /graphic_data/1.json
  def show
    @graphic_datum = GraphicDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @graphic_datum }
    end
  end

  # GET /graphic_data/new
  # GET /graphic_data/new.json
  def new
    @graphic_datum = GraphicDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @graphic_datum }
    end
  end

  # GET /graphic_data/1/edit
  def edit
    @graphic_datum = GraphicDatum.find(params[:id])
  end

  # POST /graphic_data
  # POST /graphic_data.json
  def create
    @graphic_datum = GraphicDatum.new(params[:graphic_datum])

    respond_to do |format|
      if @graphic_datum.save
        format.html { redirect_to @graphic_datum, notice: 'Graphic datum was successfully created.' }
        format.json { render json: @graphic_datum, status: :created, location: @graphic_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @graphic_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /graphic_data/1
  # PUT /graphic_data/1.json
  def update
    @graphic_datum = GraphicDatum.find(params[:id])

    respond_to do |format|
      if @graphic_datum.update_attributes(params[:graphic_datum])
        format.html { redirect_to @graphic_datum, notice: 'Graphic datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @graphic_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graphic_data/1
  # DELETE /graphic_data/1.json
  def destroy
    @graphic_datum = GraphicDatum.find(params[:id])
    @graphic_datum.destroy

    respond_to do |format|
      format.html { redirect_to graphic_data_url }
      format.json { head :no_content }
    end
  end
end
