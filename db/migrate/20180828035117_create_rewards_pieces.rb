class CreateRewardsPieces < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards_pieces do |t|
      t.references :reward, index: true
      t.references :bestowment, index: true
      t.integer :identifier, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :rewards_pieces, :rewards_bestowments, column: :bestowment_id
    add_foreign_key :rewards_pieces, :rewards_rewards, column: :reward_id
  end
end
