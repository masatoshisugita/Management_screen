class ChangeResumesColumnNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column :resumes, :name, :string, limit: 15, null: false
    change_column :resumes, :age, :integer, limit: 3, null: false
    change_column :resumes, :birthday, :date, null: false
    change_column :resumes, :promotion, :string, limit: 400, null: false
    # change_column :resumes, :name,:age,:birthday,:promotion, null: false
  end
end
