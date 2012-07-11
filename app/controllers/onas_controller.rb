
class OnasController < ApplicationController
  # GET /onas
  # GET /onas.json
  def index
    @onas = Ona.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @onas }
    end
  end

  # GET /onas/1
  # GET /onas/1.json
  def show
    @ona = Ona.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ona }
    end
  end

  # GET /onas/new
  # GET /onas/new.json
  def new
    @ona = Ona.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ona }
    end
  end

  # GET /onas/1/edit
  def edit
    @ona = Ona.find(params[:id])
  end

  # POST /onas
  # POST /onas.json
  def create
    @ona = Ona.new(params[:ona])

    respond_to do |format|
      if @ona.save
        format.html { redirect_to @ona, notice: 'Ona was successfully created.' }
        format.json { render json: @ona, status: :created, location: @ona }
      else
        format.html { render action: "new" }
        format.json { render json: @ona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /onas/1
  # PUT /onas/1.json
  def update
    @ona = Ona.find(params[:id])

    respond_to do |format|
      if @ona.update_attributes(params[:ona])
        format.html { redirect_to @ona, notice: 'Ona was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /onas/1
  # DELETE /onas/1.json
  def destroy
    @ona = Ona.find(params[:id])
    @ona.destroy

    respond_to do |format|
      format.html { redirect_to onas_url }
      format.json { head :no_content }
    end
  end
end
