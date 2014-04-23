class GlobalsController < ApplicationController
  # GET /globals
  # GET /globals.json
  def index
    @globals = Global.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @globals }
    end
  end

  # GET /globals/1
  # GET /globals/1.json
  def show
    @global = Global.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @global }
    end
  end

  # GET /globals/new
  # GET /globals/new.json
  def new
    @global = Global.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @global }
    end
  end

  # GET /globals/1/edit
  def edit
    @global = Global.find(params[:id])
  end

  def fordigitaldata
    @globals = DigitalDatum.find(params[:id])
    @globals = @globals.globals
  end

  def img1
    @globals=Global.find(params[:id])
    patient=@globals.digital_datum.examination.patient
    send_file(File.join(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Results","SpcwinGlobal.jpg"))
  end

  def img2
    @globals=Global.find(params[:id])
    patient=@globals.digital_datum.examination.patient
    send_file(File.join(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Results","SpcwinStepByStep.jpg"))
  end

  # POST /globals
  # POST /globals.json
  def create
    @global = Global.new(params[:global])

    respond_to do |format|
      if @global.save
        format.html { redirect_to @global, notice: 'Global was successfully created.' }
        format.json { render json: @global, status: :created, location: @global }
      else
        format.html { render action: "new" }
        format.json { render json: @global.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /globals/1
  # PUT /globals/1.json
  def update
    @global = Global.find(params[:id])

    respond_to do |format|
      if @global.update_attributes(params[:global])
        format.html { redirect_to @global, notice: 'Global was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @global.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /globals/1
  # DELETE /globals/1.json
  def destroy
    @global = Global.find(params[:id])
    @global.destroy

    respond_to do |format|
      format.html { redirect_to globals_url }
      format.json { head :no_content }
    end
  end
end
