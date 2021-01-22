# frozen_string_literal: true

module ChirrinChirrionAdmin
  module Concerns
    module Controllers
      module Toggles
        extend ActiveSupport::Concern

        def index
          @toggles = ChirrinChirrion.list
        end

        def new
        end

        def create
          ChirrinChirrion.add_toggle(params[:name], {description: params[:description], active: params[:active].present?})
          flash[:success] = 'Toggle has been created with success'
          redirect_to(action: :index)
        rescue ChirrinChirrion::Errors::ToggleIsRequired
          flash.now[:error] = 'Toggle name must be filled.'
          render(action: :new)
        end

        def chirrin
          ChirrinChirrion.chirrin!(params[:id])
          flash[:success] = 'Toggle has been activated with success'
          redirect_to(action: :index)
        end

        def chirrion
          ChirrinChirrion.chirrion!(params[:id])
          flash[:success] = 'Toggle has been inactivated with success'
          redirect_to(action: :index)
        end

        def destroy
          ChirrinChirrion.remove_toggle(params[:id])
          flash[:success] = 'Toggle has been removed with success'
          redirect_to(action: :index)
        end
      end
    end
  end
end
