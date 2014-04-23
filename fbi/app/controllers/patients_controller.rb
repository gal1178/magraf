# -*- encoding : utf-8 -*-

class PatientsController < ApplicationController
  before_filter :check_auth
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def addarchive
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(params[:patient])
    unless @patient.dir?
      Dir.mkdir(File.join("#{Rails.root}/public/uploads/patient/archive", "#{@patient.cart_name}"), 0755)
    end
    @patient.save
    redirect_to @patient, notice: 'Пациент был создан.'
  end

  def update
    @patient = Patient.find(params[:id])
    cid=@patient.cart_name
    @patient.update_attributes(params[:patient])
    redirect_to @patient, notice: 'Данные о пациенте были обновлены.'
    if cid!=@patient.cart_name
      Dir.mkdir(File.join("#{Rails.root}/public/uploads/patient/archive", "#{@patient.cart_name}"), 0755)
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    #Dir.rmdir(@patient.dir)
    redirect_to root_path
  end

  def download_archive
    patient = Patient.find(params[:id])
    afile = Dir.entries(patient.dir)
    for i in 0...afile.size
      if afile[i].scan(".zip").size > 0
        send_file(patient.dir+"/"+Dir.entries(patient.dir)[i],
                  :filename => Dir.entries(patient.dir)[i])
      end
    end
  end

  def unzip_file (file, destination)
    Zip::ZipFile.open(file) { |zip_file|
      zip_file.each { |f|
        f_path=File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      }
    }
  end
  def localisation(patient, examinations)
    digital_data = examinations.digital_data.create()
    digital_data.localisations.create(:file_name => "dir_changes", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/dir_changes.dat"))
    #digital_data.localisations.create(:file_name => , :data =>)
    digital_data.localisations.create(:file_name => "direction", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/direction.dat"))
    digital_data.localisations.create(:file_name => "max_min", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/max_min.dat"))
    digital_data.localisations.create(:file_name => "max_minValue", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/max_minValue.dat"))
    digital_data.localisations.create(:file_name => "x0l", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/x0l.dat"))
    digital_data.localisations.create(:file_name => "y0l", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/y0l.dat"))
    digital_data.localisations.create(:file_name => "z0l", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/z0l.dat"))
    digital_data.localisations.create(:file_name => "z0l_change", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/z0l_change.dat"))
    digital_data.localisations.create(:file_name => "z0l_minimum", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/z0l_minimum.dat"))
  end
  def current(patient, examinations)
    digital_data = examinations.digital_data[0]
    digital_data.currents.create(:file_name => "data", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/data.dat"))
  end
  def integral(patient, examinations)
    digital_data = examinations.digital_data[0]
    #digital_data.integrals.create(:file_name => , :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/"))
    digital_data.integrals.create(:file_name => "IntegralDiv1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralDiv1.txt"))
    digital_data.integrals.create(:file_name => "IntegralDiv2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralDiv2.txt"))
    digital_data.integrals.create(:file_name => "IntegralDiv3", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralDiv3.txt"))
    digital_data.integrals.create(:file_name => "IntegralDiv4", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralDiv4.txt"))
    digital_data.integrals.create(:file_name => "IntegralDiv4", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralDiv4.txt"))
    digital_data.integrals.create(:file_name => "IntegralDiv5", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralDiv5.txt"))
    digital_data.integrals.create(:file_name => "IntegralMap", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMap.txt"))
    digital_data.integrals.create(:file_name => "IntegralMap1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMap1.txt"))
    digital_data.integrals.create(:file_name => "IntegralMap2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMap2.txt"))
    digital_data.integrals.create(:file_name => "IntegralMap3", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMap3.txt"))
    digital_data.integrals.create(:file_name => "IntegralMap4", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMap4.txt"))
    digital_data.integrals.create(:file_name => "IntegralMap5", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMap5.txt"))
    digital_data.integrals.create(:file_name => "IntegralMap6", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMap6.txt"))
    digital_data.integrals.create(:file_name => "IntegralMapRat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMapRat.txt"))
    digital_data.integrals.create(:file_name => "IntegralMapRat1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMapRat1.txt"))
    digital_data.integrals.create(:file_name => "IntegralMapRat2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMapRat2.txt"))
    digital_data.integrals.create(:file_name => "IntegralMapRat3", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMapRat3.txt"))
    digital_data.integrals.create(:file_name => "IntegralMapRat4", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMapRat4.txt"))
    digital_data.integrals.create(:file_name => "IntegralMapRat5", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMapRat5.txt"))
    digital_data.integrals.create(:file_name => "IntegralMapRat6", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralMapRat6.txt"))
    digital_data.integrals.create(:file_name => "IntegralPattern", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntegralPattern.txt"))
    digital_data.integrals.create(:file_name => "IntQRS", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntQRS.txt"))
    digital_data.integrals.create(:file_name => "IntSTT", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/IntSTT.txt"))
    digital_data.integrals.create(:file_name => "UnregularInt1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/UnregularInt1.txt"))
    digital_data.integrals.create(:file_name => "UnregularInt2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/UnregularInt2.txt"))
    digital_data.integrals.create(:file_name => "UnregularInt3", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/UnregularInt3.txt"))
    digital_data.integrals.create(:file_name => "UnregularInt4", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/UnregularInt4.txt"))
    digital_data.integrals.create(:file_name => "UnregularInt5", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/UnregularInt5.txt"))
    digital_data.integrals.create(:file_name => "UnregularInt6", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/UnregularInt6.txt"))
  end
  def correlation(patient, examinations)
    digital_data = examinations.digital_data[0]
    #digital_data.correlations.create(:file_name => , :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/"))
    digital_data.correlations.create(:file_name => "cor_cor", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_cor.dat"))
    digital_data.correlations.create(:file_name => "cor_dir", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_dir.dat"))
    digital_data.correlations.create(:file_name => "cor_dir_changes", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_dir_changes.dat"))
    digital_data.correlations.create(:file_name => "cor_max", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_max.dat"))
    digital_data.correlations.create(:file_name => "cor_ps0", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_ps0.txt"))
    digital_data.correlations.create(:file_name => "cor_ps1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_ps1.txt"))
    digital_data.correlations.create(:file_name => "cor_ps2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_ps2.txt"))
    digital_data.correlations.create(:file_name => "cor_ps3", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_ps3.txt"))
    digital_data.correlations.create(:file_name => "correl", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/correl.dat"))
    digital_data.correlations.create(:file_name => "cor_s0", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_s0.txt"))
    digital_data.correlations.create(:file_name => "cor_s00", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_s00.txt"))
    digital_data.correlations.create(:file_name => "cor_s1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_s1.txt"))
    digital_data.correlations.create(:file_name => "cor_s01", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_s01.txt"))
    digital_data.correlations.create(:file_name => "cor_s2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_s2.txt"))
    digital_data.correlations.create(:file_name => "cor_s10", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_s10.txt"))
    digital_data.correlations.create(:file_name => "cor_s11", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_s11.txt"))
    digital_data.correlations.create(:file_name => "cor_x0l", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_x0l.dat"))
    digital_data.correlations.create(:file_name => "cor_y0l", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_y0l.dat"))
    digital_data.correlations.create(:file_name => "cor_z0l", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/cor_z0l.dat"))
    digital_data.correlations.create(:file_name => "rec_cor0", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/rec_cor0.txt"))
    digital_data.correlations.create(:file_name => "rec_cor1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/rec_cor1.txt"))
    digital_data.correlations.create(:file_name => "rec_cor2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/rec_cor2.txt"))
  end

  def sector(patient, examinations)
    digital_data = examinations.digital_data[0]
    #digital_data.sectors.create(:file_name => , :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/"))
    digital_data.sectors.create(:file_name => "rect_s0", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/rect_s0.txt"))
    digital_data.sectors.create(:file_name => "rect_s1", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/rect_s1.txt"))
    digital_data.sectors.create(:file_name => "rect_s2", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/rect_s2.txt"))
    digital_data.sectors.create(:file_name => "s0_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/s0_dat.txt"))
    digital_data.sectors.create(:file_name => "s1_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/s1_dat.txt"))
    digital_data.sectors.create(:file_name => "s01_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/s01_dat.txt"))
    digital_data.sectors.create(:file_name => "s2_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/s2_dat.txt"))
    digital_data.sectors.create(:file_name => "s02_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/s02_dat.txt.txt"))
    digital_data.sectors.create(:file_name => "s03_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/s03_dat.txt"))
    digital_data.sectors.create(:file_name => "sectors", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/sectors.dat"))
    digital_data.sectors.create(:file_name => "sp0_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/sp0_dat.txt"))
    digital_data.sectors.create(:file_name => "sp1_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/sp1_dat.txt"))
    digital_data.sectors.create(:file_name => "sp2_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/sp2_dat.txt"))
    digital_data.sectors.create(:file_name => "sp3_dat", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/sp3_dat.txt"))
  end

  def global(patient, examinations)
    digital_data = examinations.digital_data[0]
    digital_data.globals.create(:file_name => "g_dir", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/g_dir.dat"))
    digital_data.globals.create(:file_name => "g_glb", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/g_glb.dat"))
    digital_data.globals.create(:file_name => "Global31x31", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/Global31x31.dat"))
    digital_data.globals.create(:file_name => "g_step", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/g_step.dat"))
    digital_data.globals.create(:file_name => "StepPoints", :data => IO.read(patient.dir+"/#{patient.oname.sub(".zip", "")}/#{patient.oname.sub(".zip", "")}"+"/Tables/StepPoints.dat"))
  end

  def un_archive
    patient = Patient.find(params[:id])
    if File.exists?(patient.dir+"/#{patient.oname.sub(".zip", "")}")
      redirect_to patient, :notice => "Архив уже распакован!"
    else
      unzip_file(patient.dir+"/#{patient.oname}", patient.dir+"/#{patient.oname.sub(".zip", "")}")
      examinations = patient.examinations.create(:number => patient.oname.sub(".zip", ""))
      localisation(patient, examinations)
      current(patient, examinations)
      integral(patient, examinations)
      correlation(patient, examinations)
      sector(patient, examinations)
      global(patient, examinations)
      redirect_to patient, :notice => "Архив распакован!"
    end
  end
end
