class CreatePatientInfos < ActiveRecord::Migration
  def self.up
    create_table :patient_infos do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :patient_infos
  end
end
