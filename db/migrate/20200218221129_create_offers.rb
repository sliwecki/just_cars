class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
