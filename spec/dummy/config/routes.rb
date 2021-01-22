# frozen_string_literal: true

Rails.application.routes.draw do
  mount ChirrinChirrionAdmin::Engine => "/chirrin-chirrion-admin"
end
