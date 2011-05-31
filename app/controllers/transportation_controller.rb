class TransportationController < ApplicationController

  def meta_info
    respond_to :xml
  end

  def description
    respond_to :xml
  end

  def status
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
