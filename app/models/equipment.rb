class Equipment < ApplicationRecord
    has_many :step_equipments
    has_many :steps, through: :step_equipments
end
