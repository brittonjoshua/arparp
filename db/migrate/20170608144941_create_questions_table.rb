class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string  :title, null: false
      t.string  :text, null: false
      t.integer :best_answer_id
      t.integer :creator_id, null: false

      t.timestamps(null: false)
    end
  end
end
