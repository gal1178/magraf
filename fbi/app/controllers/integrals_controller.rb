class IntegralsController < ApplicationController
  # GET /integrals
  # GET /integrals.json
  def index
    @integrals = Integral.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @integrals }
    end
  end

  # GET /integrals/1
  # GET /integrals/1.json
  def show
    @integral = Integral.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @integral }
    end
  end

  # GET /integrals/new
  # GET /integrals/new.json
  def new
    @integral = Integral.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @integral }
    end
  end

  # GET /integrals/1/edit
  def edit
    @integral = Integral.find(params[:id])
  end

  def fordigitaldata
    @integrals = DigitalDatum.find(params[:id])
    @integrals = @integrals.integrals
  end

  def img1
    @integral=Integral.find(params[:id])
    patient=@integral.digital_datum.examination.patient
    send_file(File.join(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Results","SpcwinGlobal.jpg"))
  end

  def img2
    @integral=Integral.find(params[:id])
    patient=@integral.digital_datum.examination.patient
    send_file(File.join(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Results","SpcwinStepByStep.jpg"))
  end

  # POST /integrals
  # POST /integrals.json
  def create
    @integral = Integral.new(params[:integral])

    respond_to do |format|
      if @integral.save
        format.html { redirect_to @integral, notice: 'Integral was successfully created.' }
        format.json { render json: @integral, status: :created, location: @integral }
      else
        format.html { render action: "new" }
        format.json { render json: @integral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /integrals/1
  # PUT /integrals/1.json
  def update
    @integral = Integral.find(params[:id])

    respond_to do |format|
      if @integral.update_attributes(params[:integral])
        format.html { redirect_to @integral, notice: 'Integral was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @integral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /integrals/1
  # DELETE /integrals/1.json
  def destroy
    @integral = Integral.find(params[:id])
    @integral.destroy

    respond_to do |format|
      format.html { redirect_to integrals_url }
      format.json { head :no_content }
    end
  end
end
