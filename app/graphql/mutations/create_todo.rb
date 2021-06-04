module Mutations
  class CreateTodo < Mutations::BaseMutation
    argument :card_id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true

    type Types::TodoType

    def resolve(title:, card_id:, description:)
      Todo.create!(title: title, card_id: card_id, description: description)
    end
  end
end
