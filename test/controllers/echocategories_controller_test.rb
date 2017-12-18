require 'test_helper'

class EchocategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @echocategory = echocategories(:one)
  end

  test "should get index" do
    get echocategories_url
    assert_response :success
  end

  test "should get new" do
    get new_echocategory_url
    assert_response :success
  end

  test "should create echocategory" do
    assert_difference('Echocategory.count') do
      post echocategories_url, params: { echocategory: { description: @echocategory.description, echocatimage: @echocategory.echocatimage, name: @echocategory.name } }
    end

    assert_redirected_to echocategory_url(Echocategory.last)
  end

  test "should show echocategory" do
    get echocategory_url(@echocategory)
    assert_response :success
  end

  test "should get edit" do
    get edit_echocategory_url(@echocategory)
    assert_response :success
  end

  test "should update echocategory" do
    patch echocategory_url(@echocategory), params: { echocategory: { description: @echocategory.description, echocatimage: @echocategory.echocatimage, name: @echocategory.name } }
    assert_redirected_to echocategory_url(@echocategory)
  end

  test "should destroy echocategory" do
    assert_difference('Echocategory.count', -1) do
      delete echocategory_url(@echocategory)
    end

    assert_redirected_to echocategories_url
  end
end
