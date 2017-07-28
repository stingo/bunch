require 'test_helper'

class UrbantermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urbanterm = urbanterms(:one)
  end

  test "should get index" do
    get urbanterms_url
    assert_response :success
  end

  test "should get new" do
    get new_urbanterm_url
    assert_response :success
  end

  test "should create urbanterm" do
    assert_difference('Urbanterm.count') do
      post urbanterms_url, params: { urbanterm: { example1: @urbanterm.example1, example2: @urbanterm.example2, example3: @urbanterm.example3, example4: @urbanterm.example4, meaning1: @urbanterm.meaning1, meaning2: @urbanterm.meaning2, origin: @urbanterm.origin, termaudio: @urbanterm.termaudio, termcover: @urbanterm.termcover, title: @urbanterm.title } }
    end

    assert_redirected_to urbanterm_url(Urbanterm.last)
  end

  test "should show urbanterm" do
    get urbanterm_url(@urbanterm)
    assert_response :success
  end

  test "should get edit" do
    get edit_urbanterm_url(@urbanterm)
    assert_response :success
  end

  test "should update urbanterm" do
    patch urbanterm_url(@urbanterm), params: { urbanterm: { example1: @urbanterm.example1, example2: @urbanterm.example2, example3: @urbanterm.example3, example4: @urbanterm.example4, meaning1: @urbanterm.meaning1, meaning2: @urbanterm.meaning2, origin: @urbanterm.origin, termaudio: @urbanterm.termaudio, termcover: @urbanterm.termcover, title: @urbanterm.title } }
    assert_redirected_to urbanterm_url(@urbanterm)
  end

  test "should destroy urbanterm" do
    assert_difference('Urbanterm.count', -1) do
      delete urbanterm_url(@urbanterm)
    end

    assert_redirected_to urbanterms_url
  end
end
