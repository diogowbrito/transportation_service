class SubwaysController < ApplicationController

  def specific
    @start = (params[:start] || '1').to_i
    @end = (params[:end] || '20').to_i
    t = Time.now
    time = t.strftime("%H%M")

    day = t.wday
    if day == 1 || 2 || 3 || 4 || 5
      day = 1
    elsif day == 6
      day = 2
    else
      day = 3
    end

    @subways = Subway.where("hour >= ? AND day = ?", time, day).order(:hour).limit(@end)
    size = @subways.size
    if size < @end
      puts t
      t = t.beginning_of_day
      time = t.strftime("%H%M")

      day = t.wday
      if day == 1 || 2 || 3 || 4 || 5
        day = 1
      elsif day == 6
        day = 2
      else
        day = 3
      end

      temp = Subway.where("hour >= ? AND day = ?", time, day).order(:hour).limit(@end-size)

      temp.each do |ele|
        @subways << ele
      end
    end

    respond_to :xml
  end

  # GET /subways
  # GET /subways.xml
  def index
    @subways = Subway.find(:all, :order => "day, hour")

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @subways }
    end
  end

  # GET /subways/1
  # GET /subways/1.xml
  def show
    @subway = Subway.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @subway }
    end
  end

  # GET /subways/new
  # GET /subways/new.xml
  def new
    @subway = Subway.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @subway }
    end
  end

  # GET /subways/1/edit
  def edit
    @subway = Subway.find(params[:id])
  end

  # POST /subways
  # POST /subways.xml
  def create
    @subway = Subway.new(params[:subway])

    respond_to do |format|
      if @subway.save
        format.html { redirect_to(@subway, :notice => 'Subway was successfully created.') }
        format.xml { render :xml => @subway, :status => :created, :location => @subway }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @subway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subways/1
  # PUT /subways/1.xml
  def update
    @subway = Subway.find(params[:id])

    respond_to do |format|
      if @subway.update_attributes(params[:subway])
        format.html { redirect_to(@subway, :notice => 'Subway was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @subway.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subways/1
  # DELETE /subways/1.xml
  def destroy
    @subway = Subway.find(params[:id])
    @subway.destroy

    respond_to do |format|
      format.html { redirect_to(subways_url) }
      format.xml { head :ok }
    end
  end
end
