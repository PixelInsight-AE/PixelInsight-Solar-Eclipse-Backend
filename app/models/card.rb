class Card < ApplicationRecord
  #belongs_to :user

  #validate :one_card_per_day

  private
  def one_card_per_day
    last_card = Card.order(:created_at).last

    if last_card.created_at.to_date == Date.today
      errors.add(:base, "You can only draw one card per day.")
    end
  end


end
