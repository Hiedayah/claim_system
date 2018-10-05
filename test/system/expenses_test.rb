require "application_system_test_case"

class ExpensesTest < ApplicationSystemTestCase
  setup do
    @expense = expenses(:one)
  end

  test "visiting the index" do
    visit expenses_url
    assert_selector "h1", text: "Expenses"
  end

  test "creating a Expense" do
    visit expenses_url
    click_on "New Expense"

    fill_in "Claim", with: @expense.claim_id
    fill_in "Description", with: @expense.description
    fill_in "Expense Date", with: @expense.expense_date
    fill_in "Expense Type", with: @expense.expense_type
    fill_in "File", with: @expense.file
    click_on "Create Expense"

    assert_text "Expense was successfully created"
    click_on "Back"
  end

  test "updating a Expense" do
    visit expenses_url
    click_on "Edit", match: :first

    fill_in "Claim", with: @expense.claim_id
    fill_in "Description", with: @expense.description
    fill_in "Expense Date", with: @expense.expense_date
    fill_in "Expense Type", with: @expense.expense_type
    fill_in "File", with: @expense.file
    click_on "Update Expense"

    assert_text "Expense was successfully updated"
    click_on "Back"
  end

  test "destroying a Expense" do
    visit expenses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Expense was successfully destroyed"
  end
end
