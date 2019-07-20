class AbilityCharactersController < ActionController::API
  def create
    zoo = ZoonAbilityChara.new(create_params[:name], create_params[:seed_name])
    render json: zoo, status: 201
  end

  def activate_ability
    zoo = ZoonAbilityChara.new(create_params[:name], create_params[:seed_name])
    render json: zoo.seed_name
  end

  private

  def create_params
    params.require(:character).permit(:name, :seed_name)
  end
end
