class JobStatus < ApplicationRecord
  enum status: {
    pending: 0,     # 未処理
    processing: 1,  # 処理中
    completed: 2,   # 完了
    failed: 3       # 失敗
  }
end
