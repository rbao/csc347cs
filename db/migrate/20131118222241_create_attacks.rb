class CreateAttacks < ActiveRecord::Migration
  def change
    create_table :attacks do |t|
      t.text :vector
      t.string :ip

      t.timestamps
    end
  end
end
