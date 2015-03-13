class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :this
      t.string :that
      t.datetime :postTime
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
