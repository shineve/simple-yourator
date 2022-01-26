class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.references :company, null: false, foreign_key: true
      t.decimal :min_salary, precision: 8, scale: 2
      t.decimal :max_salary, precision: 8, scale: 2
      t.string :currency

      t.timestamps
    end
  end
end
