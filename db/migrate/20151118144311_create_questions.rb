

class CreateQuestions < ActiveRecord::Migration
  def change
  	create_table :questions do |t|
  		t.string :title
  		t.references :user
  		t.text :content
  		t.timestamps null: false
  	end
  end
end
