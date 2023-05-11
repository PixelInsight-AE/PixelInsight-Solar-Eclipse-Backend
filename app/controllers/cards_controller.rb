class CardsController < ApplicationController

  def index
    @cards = Card.all
    render 'index.json.jbuilder'
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def card_params
    params.require(:card).permit(:name_of_card)
  end
end
