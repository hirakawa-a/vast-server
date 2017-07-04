class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references :campaign, foreign_key: true
      t.references :cuepoint, foreign_key: true
      t.integer :count_start
      t.integer :count_end

      t.timestamps
    end
  end
end
