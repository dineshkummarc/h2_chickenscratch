class PatientInfosController < ApplicationController
  # GET /patient_infos
  # GET /patient_infos.xml
  def index
    @patient_infos = PatientInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @patient_infos }
    end
  end

  # GET /patient_infos/1
  # GET /patient_infos/1.xml
  def show
    @patient_info = PatientInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_info }
    end
  end

  # GET /patient_infos/new
  # GET /patient_infos/new.xml
  def new
    @patient_info = PatientInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_info }
    end
  end

  # GET /patient_infos/1/edit
  def edit
    @patient_info = PatientInfo.find(params[:id])
  end

  # POST /patient_infos
  # POST /patient_infos.xml
  def create
    @patient_info = PatientInfo.new(params[:patient_info])

    respond_to do |format|
      if @patient_info.save
        format.html { redirect_to(@patient_info, :notice => 'Patient info was successfully created.') }
        format.xml  { render :xml => @patient_info, :status => :created, :location => @patient_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @patient_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /patient_infos/1
  # PUT /patient_infos/1.xml
  def update
    @patient_info = PatientInfo.find(params[:id])

    respond_to do |format|
      if @patient_info.update_attributes(params[:patient_info])
        format.html { redirect_to(@patient_info, :notice => 'Patient info was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_infos/1
  # DELETE /patient_infos/1.xml
  def destroy
    @patient_info = PatientInfo.find(params[:id])
    @patient_info.destroy

    respond_to do |format|
      format.html { redirect_to(patient_infos_url) }
      format.xml  { head :ok }
    end
  end
end
