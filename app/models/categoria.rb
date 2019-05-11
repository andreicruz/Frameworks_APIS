class Categoria < ApplicationRecord
    has_many :produtos, dependent: :restrict_with_error
    validates :nome, presence: true,
                    length: { minimum: 3 }
end
