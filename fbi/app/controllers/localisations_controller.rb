class LocalisationsController < ApplicationController
  # GET /localisations
  # GET /localisations.json
  def index
    @localisations = Localisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localisations }
    end
  end

  # GET /localisations/1
  # GET /localisations/1.json
  def show
    @localisation = Localisation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localisation }
    end
  end

  # GET /localisations/new
  # GET /localisations/new.json
  def new
    @localisation = Localisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localisation }
    end
  end

  # GET /localisations/1/edit
  def edit
    @localisation = Localisation.find(params[:id])
  end

  # POST /localisations
  # POST /localisations.json
  def create
    @localisation = Localisation.new(params[:localisation])

    respond_to do |format|
      if @localisation.save
        format.html { redirect_to @localisation, notice: 'Localisation was successfully created.' }
        format.json { render json: @localisation, status: :created, location: @localisation }
      else
        format.html { render action: "new" }
        format.json { render json: @localisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def img1
    @localisations=Localisation.find(params[:id])
    patient=@localisations.digital_datum.examination.patient
    send_file(File.join(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Results","CurwinMaps1.jpg"))
  end

  def img2
    @localisations=Localisation.find(params[:id])
    patient=@localisations.digital_datum.examination.patient
    send_file(File.join(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Results","CurwinMaps2.jpg"))
  end

  def img3
    img=Localisation.find(params[:id]).digital_datum.examination.id
    send_file(File.join(Rails.root,'graphics',"localisation_for_examination_#{img}"))
  end

  def fordigitaldata
    @localisations = DigitalDatum.find(params[:id])
    @localisations = @localisations.localisations
    @graphic = Graphic.new
  end

  def equal
    @usr1=Patient.find(params[:id])
    @usr2=0
    @localisations = DigitalDatum.find(params[:id])
    @localisations = @localisations.localisations
  end

  def equal2
    @usr1=Patient.find(params[:id2]).examinations
  end

  # PUT /localisations/1
  # PUT /localisations/1.json
  def update
    @localisation = Localisation.find(params[:id])

    respond_to do |format|
      if @localisation.update_attributes(params[:localisation])
        format.html { redirect_to @localisation, notice: 'Localisation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @localisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localisations/1
  # DELETE /localisations/1.json
  def destroy
    @localisation = Localisation.find(params[:id])
    @localisation.destroy

    respond_to do |format|
      format.html { redirect_to localisations_url }
      format.json { head :no_content }
    end
  end
end
