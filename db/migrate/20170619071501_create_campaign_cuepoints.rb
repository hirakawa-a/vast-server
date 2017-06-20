class CreateCampaignCuepoints < ActiveRecord::Migration[5.0]
  def change
    create_table :campaign_cuepoints do |t|
      t.references :campaign, foreign_key: true
      t.references :cuepoint, foreign_key: true

      t.timestamps
    end
  end
end
