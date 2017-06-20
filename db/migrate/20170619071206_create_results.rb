class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :campaign_id
      t.integer :cuepoint_id
      t.integer :count_start
      t.integer :count_end

      t.timestamps
    end
  end
end
