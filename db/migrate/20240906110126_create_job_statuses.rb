class CreateJobStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :job_statuses do |t|
      t.integer :status, default: 0, null: false, comment: "ステータス Enum(0: pending, 1: processing, 2: completed, 3: failed)"
      t.string :message,                          comment: "メッセージ"
      t.timestamps
    end
  end
end
