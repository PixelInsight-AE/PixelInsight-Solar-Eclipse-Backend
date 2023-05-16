class TarotsController < ApplicationController
  def index
    @tarot = Tarot.all
    render json: @tarot
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


  
end
