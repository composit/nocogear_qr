class EntryMailer < ActionMailer::Base
  default from: "entries@nocogear.com"

  def entry_notification(entry)
    @entry = entry
    mail(to: CONFIG[:mail_to_addresses], subject: 'New NoCoGear Entry')
  end
end
