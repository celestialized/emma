require "application_system_test_case"

class WallpapersTest < ApplicationSystemTestCase
  setup do
    @wallpaper = wallpapers(:one)
  end

  test "visiting the index" do
    visit wallpapers_url
    assert_selector "h1", text: "Wallpapers"
  end

  test "creating a Wallpaper" do
    visit wallpapers_url
    click_on "New Wallpaper"

    fill_in "Device size", with: @wallpaper.device_size
    fill_in "Title", with: @wallpaper.title
    click_on "Create Wallpaper"

    assert_text "Wallpaper was successfully created"
    click_on "Back"
  end

  test "updating a Wallpaper" do
    visit wallpapers_url
    click_on "Edit", match: :first

    fill_in "Device size", with: @wallpaper.device_size
    fill_in "Title", with: @wallpaper.title
    click_on "Update Wallpaper"

    assert_text "Wallpaper was successfully updated"
    click_on "Back"
  end

  test "destroying a Wallpaper" do
    visit wallpapers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wallpaper was successfully destroyed"
  end
end
