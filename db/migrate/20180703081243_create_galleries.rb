class CreateGalleries < ActiveRecord::Migration[5.1]
  def change
    create_table :galleries do |t|
      t.string :ip_address, null: false, limit: 20

      t.timestamps
    end
  end
end
