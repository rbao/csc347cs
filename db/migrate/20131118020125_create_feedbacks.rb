class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :phone
      t.text :email
      t.string :description
      t.string :ip

      t.timestamps
    end
  end
end
