module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :cards, [Types::CardType], null: true
    field :card, Types::CardType, null: true do
      argument :id, Integer, required: true
    end

    field :todo, Types::TodoType, null: true do
      argument :id, Integer, required: true
    end

    def cards
      Card.all
    end

    def card(id:)
      Card.find(id)
    end

    def todo(id:)
      # Card.find(id).todo
      Todo.find(id);
    end

  end
end
