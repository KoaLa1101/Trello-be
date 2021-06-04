module Mutations
  class DestroyTodo < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::TodoType

    def resolve(id:)
      Todo.find(id).destroy!
    end
  end
end
