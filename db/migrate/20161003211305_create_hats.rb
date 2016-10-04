class CreateHats < ActiveRecord::Migration[5.0]
  def change
    create_table :hats do |t|
      t.string :color

      t.timestamps
    end
  end
end
