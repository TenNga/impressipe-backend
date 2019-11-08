module Api
    module V1
        class StepsController < ApplicationController
            def index
                steps = Step.all
                render json: steps
            end
        end
    end
end
