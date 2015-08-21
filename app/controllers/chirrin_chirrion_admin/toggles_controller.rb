require_dependency "chirrin_chirrion_admin/application_controller"

module ChirrinChirrionAdmin
  class TogglesController < ApplicationController
    include ChirrinChirrionAdmin::Concerns::Controllers::Toggles
  end
end
