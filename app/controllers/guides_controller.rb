class GuidesController < ApplicationController
  load_and_authorize_resource

  # GET /guides
  # GET /guides.json
  def index
    @guides = Guide.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @guides }
    end
  end

  # GET /guides/1
  # GET /guides/1.json
  def show
    id = params[:id].to_i
    if id == 0
      @guide = Guide.find_by_seo_url(params[:id])
    else
      @guide = Guide.find(params[:id])
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @guide }
    end
  end

  # GET /guides/new
  # GET /guides/new.json
  def new
    @guide = Guide.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @guide }
    end
  end

  # GET /guides/1/edit
  def edit
    @guide = Guide.find(params[:id])
  end

  # POST /guides
  # POST /guides.json
  def create
    @guide = Guide.new(params[:guide])

    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
        format.json { render json: @guide, status: :created, location: @guide }
      else
        format.html { render action: "new" }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /guides/1
  # PUT /guides/1.json
  def update
    @guide = Guide.find(params[:id])

    respond_to do |format|
      if @guide.update_attributes(params[:guide])
        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide = Guide.find(params[:id])
    @guide.destroy

    respond_to do |format|
      format.html { redirect_to guides_url }
      format.json { head :no_content }
    end
  end
end
