require "application_system_test_case"

class ClaimsTest < ApplicationSystemTestCase
  setup do
    @claim = claims(:one)
  end

  test "visiting the index" do
    visit claims_url
    assert_selector "h1", text: "Claims"
  end

  test "creating a Claim" do
    visit claims_url
    click_on "New Claim"

    fill_in "Aasm State", with: @claim.aasm_state
    fill_in "Approver", with: @claim.approver_id
    fill_in "Date", with: @claim.date
    fill_in "Staff", with: @claim.staff_id
    fill_in "Status", with: @claim.status
    fill_in "Verifier", with: @claim.verifier_id
    click_on "Create Claim"

    assert_text "Claim was successfully created"
    click_on "Back"
  end

  test "updating a Claim" do
    visit claims_url
    click_on "Edit", match: :first

    fill_in "Aasm State", with: @claim.aasm_state
    fill_in "Approver", with: @claim.approver_id
    fill_in "Date", with: @claim.date
    fill_in "Staff", with: @claim.staff_id
    fill_in "Status", with: @claim.status
    fill_in "Verifier", with: @claim.verifier_id
    click_on "Update Claim"

    assert_text "Claim was successfully updated"
    click_on "Back"
  end

  test "destroying a Claim" do
    visit claims_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Claim was successfully destroyed"
  end
end
