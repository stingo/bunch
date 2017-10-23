require 'test_helper'

class CompanytypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @companytype = companytypes(:one)
  end

  test "should get index" do
    get companytypes_url
    assert_response :success
  end

  test "should get new" do
    get new_companytype_url
    assert_response :success
  end

  test "should create companytype" do
    assert_difference('Companytype.count') do
      post companytypes_url, params: { companytype: { desc: @companytype.desc, name: @companytype.name } }
    end

    assert_redirected_to companytype_url(Companytype.last)
  end

  test "should show companytype" do
    get companytype_url(@companytype)
    assert_response :success
  end

  test "should get edit" do
    get edit_companytype_url(@companytype)
    assert_response :success
  end

  test "should update companytype" do
    patch companytype_url(@companytype), params: { companytype: { desc: @companytype.desc, name: @companytype.name } }
    assert_redirected_to companytype_url(@companytype)
  end

  test "should destroy companytype" do
    assert_difference('Companytype.count', -1) do
      delete companytype_url(@companytype)
    end

    assert_redirected_to companytypes_url
  end
end
