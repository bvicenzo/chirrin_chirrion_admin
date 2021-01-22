# frozen_string_literal: true

module ChirrinChirrionAdmin
  module ApplicationHelper
    def chirrin_button
      content_tag(:i, '', class: 'fa fa-flash chirrin') +
        content_tag(:span, ' Chirrin!')
    end

    def chirrion_button
      content_tag(:i, '', class: 'fa fa-flash chirrion') +
        content_tag(:span, ' Chirrion!')
    end

    def remove_toggle_button
      content_tag(:i, '', class: 'fa fa-trash remove') +
        content_tag(:span, ' Remove')
    end
  end
end
