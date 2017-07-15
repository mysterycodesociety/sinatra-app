class CreateHearts < ActiveRecord::Migration[5.1]
  def change
    create_table :hearts do |t|
      t.belongs_to :user
      t.belongs_to :tweet

      t.timestamps
    end
  end
end
