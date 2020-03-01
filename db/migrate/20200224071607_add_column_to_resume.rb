class AddColumnToResume < ActiveRecord::Migration[6.0]
  def up
    add_column :resumes, :name, :string
    add_column :resumes, :age, :integer
    add_column :resumes, :gender, :string
    add_column :resumes, :birthday, :date
    add_column :resumes, :promotion, :string
    add_column :resumes, :marry, :boolean
    add_column :resumes, :file, :string
  end

  def down
  end
end
