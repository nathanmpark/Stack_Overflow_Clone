class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :content
      t.references :user
      t.references :question
      t.timestamps
    end
  end
end
