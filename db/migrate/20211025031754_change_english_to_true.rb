class ChangeEnglishToTrue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :movies, :english, from: nil, to: true
  end
end
