xml.list(:title => "TST") do
  @buses.each do |sub|
    temp = sub.hour.to_s
    insert = aux_hour_filler(temp)
    direction = sub.direction
    number = sub.number

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

  end

end