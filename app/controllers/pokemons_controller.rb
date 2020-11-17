class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @pokemons = Pokemon.all
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to @pokemon, notice: 'Your pokemon was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @pokemon.destroy
    redirect_to root_path
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :abilities, :price, :photos)
  end
end