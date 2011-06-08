class TransportationController < ApplicationController

  def meta_info
    @address = get_address
    respond_to :xml
  end

  def description
    @address = get_address
    respond_to :xml
  end

  def status
    respond_to :xml
  end

  def all_transportations
    @start = (params[:start] || '1').to_i
    @end = (params[:end] || '7').to_i
    @next = get_address+'/all?start='+(@end+1).to_s+'&end='+(@end+1+@end-@start).to_s
    @count = (@end - @start) / 3
    t = Time.now
    time = t.strftime("%H%M")
    puts t.wday
    day = aux_day_with_sunday(t.wday)

    @subways = Subway.where("hour >= ? AND day = ?", time, day).order(:hour).limit(@end)
    @buses = Bus.where("hour >= ? AND day = ?", time, day).order(:hour).limit(@end)
    day = aux_day_without_sunday(t.wday)
    @trains = Train.where("hour >= ? AND day = ?", time, day).order(:hour).limit(@end)

    respond_to :xml
  end

  def aux_day(day)
    if day == (1 || 2 || 3 || 4 || 5)
       return day = 1
      elsif day == 6
       return day = 2
      else
       return day = 3
      end
  end

end
