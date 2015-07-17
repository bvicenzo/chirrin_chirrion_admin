require 'rails_helper'

describe 'Toggles', type: :feature do
  describe 'List toggles' do
    it 'shows the registered toggles list' do
      visit chirrin_chirrion_admin.toggles_path
      expect(current_path).to eq(chirrin_chirrion_admin.toggles_path)
    end
  end
end
