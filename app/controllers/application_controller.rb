class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :aux_day_with_sunday, :aux_day_without_sunday, :aux_hour_filler

  def aux_day_with_sunday(day)
    if day == (1 || 2 || 3 || 4 || 5)
       return day = 1
      elsif day == 6
       return day = 2
      else
       return day = 3
      end
  end

  def aux_day_without_sunday(day)
    if day == (1 || 2 || 3 || 4 || 5)
       return day = 1
      else
       return day = 2
      end
  end

  def aux_hour_filler(temp)
    if temp.size == 3
     return temp.insert(-3, ":").insert(0, "0")
    elsif temp.size == 2
      return temp.insert(-3, ":").insert(0, "0").insert(0, "0")
    elsif temp.size == 1
      return temp.insert(0, "0").insert(-3, ":").insert(0, "0").insert(0, "0")
    else
       return temp.insert(-3, ":")
    end
  end
end
