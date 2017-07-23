require 'test_helper'

class HowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @how = hows(:one)
  end

  test "should get index" do
    get hows_url
    assert_response :success
  end

  test "should get new" do
    get new_how_url
    assert_response :success
  end

  test "should create how" do
    assert_difference('How.count') do
      post hows_url, params: { how: { description: @how.description, duration: @how.duration, howcover: @how.howcover, name: @how.name, recipetips: @how.recipetips, slug: @how.slug, subbody1: @how.subbody1, subbody2: @how.subbody2, subbody3: @how.subbody3, subtitle1: @how.subtitle1, subtitle2: @how.subtitle2, subtitle3: @how.subtitle3, subtitle: @how.subtitle, video: @how.video } }
    end

    assert_redirected_to how_url(How.last)
  end

  test "should show how" do
    get how_url(@how)
    assert_response :success
  end

  test "should get edit" do
    get edit_how_url(@how)
    assert_response :success
  end

  test "should update how" do
    patch how_url(@how), params: { how: { description: @how.description, duration: @how.duration, howcover: @how.howcover, name: @how.name, recipetips: @how.recipetips, slug: @how.slug, subbody1: @how.subbody1, subbody2: @how.subbody2, subbody3: @how.subbody3, subtitle1: @how.subtitle1, subtitle2: @how.subtitle2, subtitle3: @how.subtitle3, subtitle: @how.subtitle, video: @how.video } }
    assert_redirected_to how_url(@how)
  end

  test "should destroy how" do
    assert_difference('How.count', -1) do
      delete how_url(@how)
    end

    assert_redirected_to hows_url
  end
end
