class Categoria < ApplicationRecord
    has_many :produtos
    validates :nome, presence: true,
                    length: { minimum: 3 }
end
