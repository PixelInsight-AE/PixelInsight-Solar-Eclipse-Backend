class TarotsController < ApplicationController
  def index
    @tarot = Tarot.all
    render json: @tarot
  end
  def create
    @tarot = Tarot.new(tarot_params)
    @tarot.save
    
    render 'create.json.jbuilder'
  end

  def random_card
    @tarot = Tarot.all.sample
    render 'create.json.jbuilder'
  end
  def show
    @tarot = Tarot.find_by(name_of_card: params[:id])
    render 'create.json.jbuilder'
  end
  def destroy
    @tarot = Tarot.find_by(params[:name_of_card])
    @tarot.destroy
    render json: {message: "Card deleted"}
  end


  def tarot_params
    params.require(:tarot).permit(:name_of_card, :card_image, :card_meaning, :card_description, :meaning_up, :meaning_rev, :astrology, :numerology, :major_minor, :element)
  end
end
