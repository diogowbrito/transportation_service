xml.list(:title => "Transportes", :start => @start, :end => @end, :next => @next) do
  @count.times { |bus|
    temp = @buses[bus].hour.to_s
    insert = aux_hour_filler(temp)
    direction = @buses[bus].direction
    number = @buses[bus].number

    if direction == "Cacilhas"
      xml.item(insert, :title => number.to_s+" Universidade -> Cacilhas")
    elsif direction == "Monte de Caparica"
      xml.item(insert, :title => number.to_s+" Universidade -> Monte de Caparica")
    elsif direction == "Trafaria"
      xml.item(insert, :title => number.to_s+" Universidade -> Trafaria")
    elsif direction == "Marisol"
      xml.item(insert, :title => number.to_s+" Universidade -> Marisol")
    else
      xml.item(insert, :title => number.to_s+" Universidade -> Fonte da Telha")
    end
  }

  @count.times { |mts|
    temp = @subways[mts].hour.to_s
    insert = aux_hour_filler(temp)
    xml.item(insert, :title => "Universidade -> Cacilhas")
  }

  @count.times { |train|
    temp = @trains[train].hour.to_s
    insert = aux_hour_filler(temp)
    direction = @trains[train].direction
    if direction == "coina"
      xml.item(insert, :title => "Pragal -> Coina")
    elsif direction == "setubal"
      xml.item(insert, :title => "Pragal -> Setubal")
    else
      xml.item(insert, :title => "Pragal -> Lisboa")
    end

  }

end