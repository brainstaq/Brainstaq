class Transaction < ApplicationRecord
  belongs_to :sub, foreign_key: :sub_id
end
