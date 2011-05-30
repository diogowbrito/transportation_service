xml.record(:title => "MTS") do
  @subways.each do |sub|
    temp = sub.hour.to_s
    if temp.size == 3
     insert = temp.insert(-3, ":").insert(0, "0")
    elsif temp.size == 2
      insert = temp.insert(-3, ":").insert(0, "0").insert(0, "0")
    else
       insert = temp.insert(-3, ":")
    end
    xml.text(insert, :title => "Universidade -> Cacilhas")
  end

end