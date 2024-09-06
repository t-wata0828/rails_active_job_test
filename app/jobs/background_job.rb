class BackgroundJob < ApplicationJob
  queue_as :default

  # BackgroundJob.perform_later("テスト")
  def perform(params)
    # 遅延シミュレーション
    ActiveRecord::Base.transaction do
      Rails.logger.info("---------------> start job: #{Time.now}")
      # job_status = JobStatus.create!(status: :pending)

      sleep 15  # 10秒間遅延させる

      Rails.logger.info("---------------> processing object: #{params.inspect}")
      # job_status.update!(status: :processing)

      Rails.logger.info("---------------> end job: #{Time.now}")
    end
  end
end
