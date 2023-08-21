class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :away_team, foreign_key: { to_table: :teams }
      t.string :division
      t.integer :home_team_score
      t.integer :away_team_score

      t.timestamps
    end
  end
end
