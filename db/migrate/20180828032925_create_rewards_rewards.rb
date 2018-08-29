class CreateRewardsRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards_rewards do |t|
      t.references :user, foreign_key: true
      t.integer :state, null: false, default: 0

      t.timestamps
    end
  end
end
