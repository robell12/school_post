class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.string :title
      t.string :students
      t.belongs_to :school, foreign_key: true

      t.timestamps
    end
  end
end
