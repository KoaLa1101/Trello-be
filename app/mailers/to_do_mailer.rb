class ToDoMailer < ApplicationMailer
  def new_todo
    @user = params[:user]
    mail(to: @user.email, subject: "New todo was created by #{@user.name}")
  end
end
