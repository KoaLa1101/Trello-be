module Types
  class MutationType < Types::BaseObject
    field :create_card, mutation: Mutations::CreateCard
    field :destroy_card, mutation: Mutations::DestroyCard
    field :update_card, mutation: Mutations::UpdateCard

    field :create_todo, mutation: Mutations::CreateTodo
    field :destroy_todo, mutation: Mutations::DestroyTodo
  end
end
