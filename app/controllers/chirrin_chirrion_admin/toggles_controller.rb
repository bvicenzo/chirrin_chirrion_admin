require_dependency "chirrin_chirrion_admin/application_controller"

module ChirrinChirrionAdmin
  class TogglesController < ApplicationController
    def index
      @toggles = ChirrinChirrion.list
    end

    def new
    end

    def create
    end

    def acivate
    end

    def inactivate
    end
  end
end
