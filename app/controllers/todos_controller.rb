class TodosController < ApplicationController

  def create
    @card = Card.find(params[:card_id])
    @todo = @card.todos.build(title: params[:title], description: params[:description], user_id: params[:user_id])
    if @todo.save
      ToDoMailer.with(user: current_user).new_todo.deliver_now
      flash[:notice] = "ToDo was successfully created"
    else
      flash[:alert] = @todo.errors.full_messages.join(", ")
    end
    redirect_to card_url(id: @card)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to card_url(id: @todo.card)
  end
end



