class CreateWhereabouts < ActiveRecord::Migration
  def change
    create_table :whereabouts do |t|
      t.string :datetime
      t.point :latlon, geographic: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
