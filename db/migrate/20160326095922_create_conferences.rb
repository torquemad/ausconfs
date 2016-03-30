class CreateConferences < ActiveRecord::Migration
  
  def change
    create_table :conferences do |t|
      t.string  :name
      t.date    :date
      t.text    :summary
      t.text    :url  
      t.text    :description
      t.timestamps
    end
  end
end
