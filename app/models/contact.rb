class Contact < MailForm::Base
  attribute :name, :validate => true
  attribute :mail, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message

  def headers
    {
      :subject => "Mesaj Jadore",
      :to => "murinuareemail@gmail.com",
      :from => %("#{name}" <#{mail}>)
    }
  end
end
