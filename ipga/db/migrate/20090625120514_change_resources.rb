class ChangeResources < ActiveRecord::Migration
  REFERENCE_DATAS = [:department, :location, :industry, :level, :official_grade]

  def self.up
    create_reference_datas(REFERENCE_DATAS)
    create_table(:strengths) { |t| t.integer :rank }

    change_table(:resources) do |t|
      t.remove :title
      t.references *(REFERENCE_DATAS << :strength)
    end
  end

  def self.down
    REFERENCE_DATAS << :strength
    change_table(:resources) do |t|
      t.remove_references *(REFERENCE_DATAS)
      t.string :title
    end

    (REFERENCE_DATAS).each { |object_name| drop_table object_name.to_s.pluralize}
  end

  private

  def self.create_reference_datas(object_names)
    object_names.each do |object_name|
      create_table(object_name.to_s.pluralize) { |t| t.string :name }
    end
  end
end
