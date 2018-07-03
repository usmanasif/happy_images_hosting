class AddCodeToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :code, :string, limit: 50, null: false
  end
end
