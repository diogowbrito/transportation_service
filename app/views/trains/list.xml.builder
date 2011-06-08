xml.list(:title => "Horário Fertagus") do
  @trains.each do |sub|
    temp = sub.hour.to_s
    insert = aux_hour_filler(temp)
    direction = sub.direction
    if direction == "coina"
      xml.item(insert, :title => "Pragal -> Coina")
    elsif direction == "setubal"
      xml.item(insert, :title => "Pragal -> Setubal")
    else
      xml.item(insert, :title => "Pragal -> Lisboa")
    end

  end

end