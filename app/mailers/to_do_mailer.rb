class ToDoMailer < ApplicationMailer
  def new_todo
    @user = params[:user]
    @card_user = User.find_by_id(params[:user_id])
    mail(to: @card_user.email, subject: "New todo was created by #{@user.name}")
  end
end
