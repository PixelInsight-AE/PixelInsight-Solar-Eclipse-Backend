json.cards do
  json.array! @cards do |card|
    json.name_of_card card.name_of_card
  end
end
