class Account < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: { in: %w(male female N/A),
                                  message: "must be either 'male', 'female', or 'N/A'" }

  validates :age, numericality: { greater_than_or_equal_to: 20,
                                  message: "must be at least 20"}

  validates :age, numericality: { less_than_or_equal_to: 100,
                                  message: "must be at most 100"}

end
