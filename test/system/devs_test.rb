require "application_system_test_case"

class DevsTest < ApplicationSystemTestCase
  setup do
    @dev = devs(:one)
  end

  test "visiting the index" do
    visit devs_url
    assert_selector "h1", text: "Devs"
  end

  test "should create dev" do
    visit devs_url
    click_on "New dev"

    fill_in "Name", with: @dev.name
    click_on "Create Dev"

    assert_text "Dev was successfully created"
    click_on "Back"
  end

  test "should update Dev" do
    visit dev_url(@dev)
    click_on "Edit this dev", match: :first

    fill_in "Name", with: @dev.name
    click_on "Update Dev"

    assert_text "Dev was successfully updated"
    click_on "Back"
  end

  test "should destroy Dev" do
    visit dev_url(@dev)
    click_on "Destroy this dev", match: :first

    assert_text "Dev was successfully destroyed"
  end
end
