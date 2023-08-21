class TournamentController < ApplicationController
  def schedule
  end


  def generate_schedule
    teams = Team.all.shuffle

    division_a_teams = teams.shift(8)
    division_b_teams = teams

    current_division = 'A' # Изначально начинаем с дивизиона 'A'

    division_a_teams.each do |home_team|
      division_b_teams.each do |away_team|
        home_score = rand(0..5)
        away_score = rand(0..5)
        Match.create(
          division: current_division,
          home_team: home_team,
          away_team: away_team,
          home_team_score: home_score,
          away_team_score: away_score
        )
        current_division = (current_division == 'A') ? 'B' : 'A' # Переключаем дивизион
      end
    end

    redirect_to tournament_schedule_path, notice: 'Расписание сгенерировано'
  end

  def generate_results
    generate_division_results('A')
    generate_division_results('B')
    generate_playoff_results

    redirect_to tournament_schedule_path, notice: 'Результаты турнира сгенерированы'
  end

  private

  def generate_division_results(division)
    teams = Team.all.shuffle

    division_a_teams = teams.shift(8)
    division_b_teams = teams

    division_a_teams.each do |home_team|
      division_b_teams.each do |away_team|
        home_score = rand(0..5)
        away_score = rand(0..5)
        Match.create(
          division: division,
          home_team: home_team,
          away_team: away_team,
          home_team_score: home_score,
          away_team_score: away_score
        )
      end
    end
  end

  def generate_playoff_results
    playoff_teams = Team.where(champion: true)

    playoff_teams.each do |team|
      matches_won = team.home_matches.where('home_team_score > away_team_score').count
      if matches_won == 4
        team.update(champion: true)
      end
    end
  end
end
