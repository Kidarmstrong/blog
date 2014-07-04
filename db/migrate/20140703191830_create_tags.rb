class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :colour

      t.timestamps
    end

    Tags.create(name: 'Training', colour: 'green')
    Tags.create(name: 'Experience', colour: 'red')
    Tags.create(name: 'Socialising', colour: 'yellow')
    Tags.create(name: 'Food', colour: 'blue')
    Tags.create(name: 'Behaviour', colour: 'orange')
    Tags.create(name: 'Days Out', colour: 'purple')
  end
end
