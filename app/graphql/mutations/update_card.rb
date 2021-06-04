module Mutations
  class UpdateCard < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true

    type Types::CardType

    def resolve(id:, title:)
      card = Card.find(id)

      card.update!(title: title)

      card
    end
  end
end

