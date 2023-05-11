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

  
  def create
    @card = Card.new(card_params)
    if @card.save
      render 'create.json.jbuilder', status: :created
    else
      render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
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
