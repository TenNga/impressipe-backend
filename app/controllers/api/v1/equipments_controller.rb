module Api
    module V1
        class EquipmentsController < ApplicationController
            def index
                equipment = Equipment.all
                render json: equipment
            end
        end
    end
end
