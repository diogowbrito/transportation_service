class TrainsController < ApplicationController

  def list
    @start = (params[:start] || '1').to_i
    @end = (params[:end] || '20').to_i
    t = Time.now
    time = t.strftime("%H%M")
    day = aux_day_without_sunday(t.wday)

    @trains = Train.where("hour >= ? AND day = ?", time, day).order(:hour).limit(@end)
    size = @trains.size

    if size < @end
      t = t.beginning_of_day
      time = t.strftime("%H%M")

      day = aux_day_without_sunday(t.wday)

      temp = Train.where("hour >= ? AND day = ?", time, day).order(:hour).limit(@end-size)

      temp.each do |ele|
        @trains << ele
      end
    end

    respond_to :xml
  end

  # GET /trains
  # GET /trains.xml
  def index
    @trains = Train.find(:all, :order => "day, hour")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trains }
    end
  end

  # GET /trains/1
  # GET /trains/1.xml
  def show
    @train = Train.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @train }
    end
  end

  # GET /trains/new
  # GET /trains/new.xml
  def new
    @train = Train.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @train }
    end
  end

  # GET /trains/1/edit
  def edit
    @train = Train.find(params[:id])
  end

  # POST /trains
  # POST /trains.xml
  def create
    @train = Train.new(params[:train])

    respond_to do |format|
      if @train.save
        format.html { redirect_to(@train, :notice => 'Train was successfully created.') }
        format.xml  { render :xml => @train, :status => :created, :location => @train }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @train.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trains/1
  # PUT /trains/1.xml
  def update
    @train = Train.find(params[:id])

    respond_to do |format|
      if @train.update_attributes(params[:train])
        format.html { redirect_to(@train, :notice => 'Train was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @train.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1
  # DELETE /trains/1.xml
  def destroy
    @train = Train.find(params[:id])
    @train.destroy

    respond_to do |format|
      format.html { redirect_to(trains_url) }
      format.xml  { head :ok }
    end
  end
end
