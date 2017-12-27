require 'test_helper'

class HowcategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @howcategory = howcategories(:one)
  end

  test "should get index" do
    get howcategories_url
    assert_response :success
  end

  test "should get new" do
    get new_howcategory_url
    assert_response :success
  end

  test "should create howcategory" do
    assert_difference('Howcategory.count') do
      post howcategories_url, params: { howcategory: { description: @howcategory.description, name: @howcategory.name, slug: @howcategory.slug } }
    end

    assert_redirected_to howcategory_url(Howcategory.last)
  end

  test "should show howcategory" do
    get howcategory_url(@howcategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_howcategory_url(@howcategory)
    assert_response :success
  end

  test "should update howcategory" do
    patch howcategory_url(@howcategory), params: { howcategory: { description: @howcategory.description, name: @howcategory.name, slug: @howcategory.slug } }
    assert_redirected_to howcategory_url(@howcategory)
  end

  test "should destroy howcategory" do
    assert_difference('Howcategory.count', -1) do
      delete howcategory_url(@howcategory)
    end

    assert_redirected_to howcategories_url
  end
end
