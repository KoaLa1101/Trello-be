# Preview all emails at http://localhost:8080/rails/mailers/to_do_mailer
class ToDoMailerPreview < ActionMailer::Preview
  def new_todo
    ToDoMailer.with(User.last.email).new_todo(User.last.email)
  end
end
