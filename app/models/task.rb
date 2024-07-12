class Task < ApplicationRecord
  belongs_to :user

  validates :name, :due_date, presence: true

  scope :overdue, -> { where("due_date < ?", Date.today).where(completed: false) }
  scope :completed, -> { where(completed: true) }
end
