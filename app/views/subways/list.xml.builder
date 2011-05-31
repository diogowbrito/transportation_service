xml.list(:title => "MTS") do
  @subways.each do |sub|
    temp = sub.hour.to_s
    insert = aux_hour_filler(temp)
    xml.item(insert, :title => "Universidade -> Cacilhas")
  end

end