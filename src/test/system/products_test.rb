require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    check "Availability" if @product.availability
    fill_in "Category", with: @product.category
    fill_in "Customer", with: @product.customer_id
    fill_in "Picture", with: @product.picture
    fill_in "Price", with: @product.price
    fill_in "State", with: @product.state
    fill_in "Suburb", with: @product.suburb
    fill_in "Vendor", with: @product.vendor_id
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    check "Availability" if @product.availability
    fill_in "Category", with: @product.category
    fill_in "Customer", with: @product.customer_id
    fill_in "Picture", with: @product.picture
    fill_in "Price", with: @product.price
    fill_in "State", with: @product.state
    fill_in "Suburb", with: @product.suburb
    fill_in "Vendor", with: @product.vendor_id
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
