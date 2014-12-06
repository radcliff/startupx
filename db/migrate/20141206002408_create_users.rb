class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, index: true, unique: true

      t.timestamps
    end
  end
end
