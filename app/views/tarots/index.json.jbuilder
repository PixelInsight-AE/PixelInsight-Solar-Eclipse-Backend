json.tarots do
  json.array! @tarot do |tarot|
    json.name_of_card tarot.name_of_card
  end
end
