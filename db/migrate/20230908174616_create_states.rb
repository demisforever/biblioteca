class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.datetime :borrowed_at
      t.datetime :returned_at
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
