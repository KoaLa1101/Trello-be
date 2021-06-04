module Types
  class CardType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :todos, [Types::TodoType], null: false
  end
end
