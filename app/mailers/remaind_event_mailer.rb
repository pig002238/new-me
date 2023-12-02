class RemaindEventMailer < ApplicationMailer
  def creation_email(reminder)
    @reminder = reminder # メールのテンプレを作成するときに使用します
    mail(
      subject: "【Converce】イベントリマインダー", # メールの件名
      to: reminder.user.email,                # メールの宛先
    )
  end
end
