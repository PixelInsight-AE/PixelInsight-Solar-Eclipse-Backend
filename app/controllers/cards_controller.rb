class CardsController < ApplicationController
 
  def index
    @cards = Card.all
    render 'index.json.jbuilder'
  end

  def index_user_cards
    user = User.find_by(username: params[:username])
    if user.nil?
      render json: { error: 'User not found' }, status: :not_found
    else
      @cards = user.cards.all.order(created_at: :desc)
      render 'index.json.jbuilder'
    end
  end
  

  def card_of_the_day
    @card = Card.order(created_at: :desc).first
    render 'card_of_day.json.jbuilder'
  end
 
  def create_user_card
    token = cookies.permanent.signed[:sea_sessions_token]
    session = Session.find_by(token: token)
    if session
      user = session.user
      @card = user.cards.new(card_params)
      if @card.save
        render 'create.json.jbuilder', status: :created
      else
        render json: { errors: @card.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {message: "Not authenticated"}, status: :unauthorized
    end
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
    @card = Card.find_by(params[:name_of_card])
    render 'show.json.jbuilder'
  end



  private
  def card_params
    params.require(:card).permit(:name_of_card, :card_description, :card_image, :meaning_rev, :meaning_up, :element, :astrology, :numerology, :major_minor, :user_feeling, :user_thoughts)
  end
end
