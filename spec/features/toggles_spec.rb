# frozen_string_literal: true

require 'spec_helper'

describe 'Toggles', type: :feature do
  after { ChirrinChirrion.list.each{ |toggle| ChirrinChirrion.remove_toggle(toggle.name) } }

  describe 'List toggles' do
    context 'when the list is empty' do
      before { visit chirrin_chirrion_admin.toggles_path }

      it 'shows the title and the header list' do
        expect(page).to have_content('Active')
        expect(page).to have_content('Description')
        expect(page).to have_content('Actions')
        expect(page).to have_content('New Toggle')
      end
    end

    context 'when the list has toggles' do
      before do
        ChirrinChirrion.add_toggle('new_user_register_validation', { active: true, description: 'When this is active, gender, age and phone number are not required' })
        ChirrinChirrion.add_toggle('new_payment_gateway', { active: false, description: 'Changes the gateway to ne new one' })
        visit chirrin_chirrion_admin.toggles_path
      end

      it 'shows the registered toggles list' do
        expect(page).to have_content('Toggles')
        expect(page).to have_content('new_user_register_validation')
        expect(page).to have_content('When this is active, gender, age and phone number are not required')
        expect(page).to have_content('true')
        expect(page).to have_content('new_payment_gateway')
        expect(page).to have_content('Changes the gateway to ne new one')
        expect(page).to have_content('false')
        expect(page).to have_content('New Toggle')
      end
    end
  end

  describe 'Create toggles' do
    before { visit chirrin_chirrion_admin.new_toggle_path }

    it 'dows not create the toggle when its name is not set' do
       expect(page).to have_content('Create Toggle')
       fill_in 'Name', with: ''
       check('Active')
       fill_in 'Description', with: 'I Forgot to fill the toggle name'
       click_button('Create')
       expect(page).to have_content('Toggle name must be filled.')
       expect(find_field('Description')).to have_content('I Forgot to fill the toggle name')
       expect(find('#active').value).to eq('1')
    end

    it 'success to create an inactive toggle' do
       expect(page).to have_content('Create Toggle')
       fill_in 'Name', with: 'new_user_register_validation'
       uncheck('Active')
       fill_in 'Description', with: 'When this is active, gender, age and phone number are not required'
       click_button('Create')
       expect(page).to have_content('Toggle has been created with success')
       expect(page).to have_content('new_user_register_validation')
       expect(page).to have_content('When this is active, gender, age and phone number are not required')
       expect(page).to have_content('false')
    end

    it 'success to create an active toggle' do
       expect(page).to have_content('Create Toggle')
       fill_in 'Name', with: 'new_user_register_validation'
       check('Active')
       fill_in 'Description', with: 'When this is active, gender, age and phone number are not required'
       click_button('Create')
       expect(page).to have_content('Toggle has been created with success')
       expect(page).to have_content('new_user_register_validation')
       expect(page).to have_content('When this is active, gender, age and phone number are not required')
       expect(page).to have_content('true')
    end
  end

  describe 'Removes a toggle' do
    before do
      ChirrinChirrion.add_toggle('new_payment_gateway', { active: false, description: 'Changes the gateway to ne new one' })
      visit chirrin_chirrion_admin.toggles_path
    end

    it 'removes the togle from base', js: true do
      click_link('remove_new_payment_gateway')
      page.evaluate_script('window.confirm = function() { return true; }')
      expect(page).to have_content('Toggle has been removed with success')
      expect(page).not_to have_content('new_payment_gateway')
      expect(page).not_to have_content('Changes the gateway to ne new one')
    end
  end

  describe 'Activating and Inactivating a toggle' do
    before do
      ChirrinChirrion.add_toggle('new_payment_gateway', { active: active, description: 'Changes the gateway to ne new one' })
      visit chirrin_chirrion_admin.toggles_path
    end

    context 'when the toggle is active' do
      let(:active) { true }

      it 'makes the togle inactive', js: true do
        expect(page).to have_content('Chirrion!')
        click_link('chirrion_new_payment_gateway')
        page.evaluate_script('window.confirm = function() { return true; }')
        expect(page).to have_content('Toggle has been inactivated with success')
        expect(page).to have_content('false')
      end
    end

    context 'when the toggle is inactive' do
      let(:active) { false }

      it 'makes the toggle active', js: true do
        expect(page).to have_content('Chirrin!')
        click_link('chirrin_new_payment_gateway')
        page.evaluate_script('window.confirm = function() { return true; }')
        expect(page).to have_content('Toggle has been activated with success')
        expect(page).to have_content('true')
      end
    end
  end
end
