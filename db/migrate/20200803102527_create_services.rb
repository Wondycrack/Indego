class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :description
      t.float :rate
      t.string :speciality
      t.string :design_type
      t.string :project_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
