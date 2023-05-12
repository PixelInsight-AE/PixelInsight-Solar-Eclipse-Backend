class CardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @cards = Card.all
    render 'index.json.jbuilder'
  end
  def card_of_the_day
    @card = Card.order(created_at: :desc).first
    render 'card_of_day.json.jbuilder'
  end
  def random_card
    @card = Card.all.sample
    render 'create.json.jbuilder'
  end

  
  def create
    @card = Card.new(card_params)
    #make sure card is not already in database
    if Card.find_by(name_of_card: @card.name_of_card)
      render json: { errors: "Card already exists" }, status: :unprocessable_entity
    else
      if @card.save
        render 'create.json.jbuilder', status: :created
      else
        render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
  def show
    @card = Card.find(params[:id])
    render 'show.json.jbuilder'
  end



  private
  def card_params
    params.require(:card).permit(:name_of_card, :card_description, :card_image, :meaning_rev, :meaning_up, :element, :astrology, :numerology, :major_minor, :user_feeling, :user_thoughts)
  end
end
