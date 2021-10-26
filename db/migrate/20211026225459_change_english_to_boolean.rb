class ChangeEnglishToBoolean < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :english
    add_column :movies, :english, :boolean, default: true
  end
end
