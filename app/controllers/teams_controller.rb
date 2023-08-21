class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_path, notice: 'Команда успешно создана'
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
