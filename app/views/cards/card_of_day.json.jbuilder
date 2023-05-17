json.card do
  json.id              @card.id
  json.name_of_card     @card.name_of_card
  json.card_description @card.card_description
  json.astrology        @card.astrology
  json.element          @card.element
  json.meaning_rev      @card.meaning_rev
  json.meaning_up       @card.meaning_up
  json.numerology       @card.numerology
  json.major_minor      @card.major_minor
  json.card_image       @card.card_image
  json.user_feeling     @card.user_feeling
  json.user_thoughts    @card.user_thoughts
 
end