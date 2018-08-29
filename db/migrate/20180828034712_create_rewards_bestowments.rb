class CreateRewardsBestowments < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards_bestowments do |t|
      t.belongs_to :bestower, foreign_key: { to_table: :users }
      t.belongs_to :bestowed, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
