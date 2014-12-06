class AddIndexToWhereabouts < ActiveRecord::Migration
  def change
    add_index :whereabouts, :latlon, spatial: true
  end
end
