# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  has_many :todos, dependent: :destroy
  validates :title, presence: true

  # scope :actual, -> { where(created_at: Date.today - 1.month) }
  scope :actual, -> {}
end