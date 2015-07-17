require 'rails_helper'

describe 'Toggles', type: :feature do
  describe 'List toggles' do
    context 'when the list is empt' do
      it 'shows the title and the header list' do
        visit chirrin_chirrion_admin.toggles_path
        expect(page).to have_content('Toggles')
        expect(page).to have_content('Active')
        expect(page).to have_content('Description')
        expect(page).to have_content('Actions')
      end
    end

    context 'when the list has toggles' do
      before do
        ChirrinChirrion.add_toggle('new_user_register_validation', { active: true, description: 'When this is active, gender, age and phone number are not required' })
        ChirrinChirrion.add_toggle('new_payment_gateway', { active: false, description: 'Changes the gateway to ne new one' })
      end

      it 'shows the registered toggles list' do
        visit chirrin_chirrion_admin.toggles_path
        expect(page).to have_content('Toggles')
        expect(page).to have_content('new_user_register_validation')
        expect(page).to have_content('When this is active, gender, age and phone number are not required')
        expect(page).to have_content('true')
        expect(page).to have_content('new_payment_gateway')
        expect(page).to have_content('Changes the gateway to ne new one')
        expect(page).to have_content('false')
      end
    end
  end
end
