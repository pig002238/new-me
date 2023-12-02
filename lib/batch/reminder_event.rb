class Batch::ReminderEvent
  def self.reminder_event
    # Event.reload
    remindeies = Reminder.all
    remindeies.each do |reminder|
      time_difference = (reminder.remind_at - Time.now.in_time_zone("Tokyo")) / 3600 # AM9:00との時間差を時間単位で算出する
      if time_difference <= 39 && time_difference >= 15  && reminder.user.email_receiving_activation == true # 次の日のスケジュールなのかユーザーがリマインド機能をオンにしているかを判定
        RemaindEventMailer.creation_email(reminder).deliver_now # メールを送信するためのメソッド
        p "メールを#{reminder.user.name}に送信しました" # ログに表示するメッセージ
      rescue StandardError => e
      end
    end
  end
end
