class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :image_url
      t.string :answer
      t.string :subject
      t.string :topic

      t.timestamps
    end
  end
end
