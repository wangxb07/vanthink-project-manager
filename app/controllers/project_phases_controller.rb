class ProjectPhasesController < ApplicationController
  # GET /project_phases
  # GET /project_phases.json
  def index
    @project_phases = ProjectPhase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @project_phases }
    end
  end

  # GET /project_phases/1
  # GET /project_phases/1.json
  def show
    @project_phase = ProjectPhase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @project_phase }
    end
  end

  # GET /project_phases/new
  # GET /project_phases/new.json
  def new
    @project_phase = ProjectPhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @project_phase }
    end
  end

  # GET /project_phases/1/edit
  def edit
    @project_phase = ProjectPhase.find(params[:id])
  end

  # POST /project_phases
  # POST /project_phases.json
  def create
    @project_phase = ProjectPhase.new(params[:project_phase])

    respond_to do |format|
      if @project_phase.save
        format.html { redirect_to @project_phase, :notice => 'Project phase was successfully created.' }
        format.json { render :json => @project_phase, :status => :created, :location => @project_phase }
      else
        format.html { render :action => "new" }
        format.json { render :json => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /project_phases/1
  # PUT /project_phases/1.json
  def update
    @project_phase = ProjectPhase.find(params[:id])

    respond_to do |format|
      if @project_phase.update_attributes(params[:project_phase])
        format.html { redirect_to @project_phase, :notice => 'Project phase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /project_phases/1
  # DELETE /project_phases/1.json
  def destroy
    @project_phase = ProjectPhase.find(params[:id])
    @project_phase.destroy

    respond_to do |format|
      format.html { redirect_to project_phases_url }
      format.json { head :no_content }
    end
  end
end
