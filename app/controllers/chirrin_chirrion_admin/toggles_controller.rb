# frozen_string_literal: true

require_dependency "chirrin_chirrion_admin/application_controller"

module ChirrinChirrionAdmin
  class TogglesController < ApplicationController
    include ChirrinChirrionAdmin::Concerns::Controllers::Toggles

    VALID_FRONT_END_FRAMEWORKS = %i(bootstrap materialize)

    layout :resolve_layout

    private

    def resolve_layout
      framework = ChirrinChirrionAdmin.front_end_framework

      if VALID_FRONT_END_FRAMEWORKS.include?(framework)
        layout_for(framework)
      else
        layout_for(:default)
      end
    end

    def layout_for(framework)
      "chirrin_chirrion_admin/#{framework.to_s}"
    end
  end
end
