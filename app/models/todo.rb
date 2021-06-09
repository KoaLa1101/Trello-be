# frozen_string_literal: true

class Todo < ApplicationRecord
  belongs_to :card
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
end