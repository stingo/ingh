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
      post hows_url, params: { how: { body: @how.body, howcover: @how.howcover, profile_id: @how.profile_id, title: @how.title, video: @how.video, —skip-stylesheets: @how.—skip-stylesheets } }
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
    patch how_url(@how), params: { how: { body: @how.body, howcover: @how.howcover, profile_id: @how.profile_id, title: @how.title, video: @how.video, —skip-stylesheets: @how.—skip-stylesheets } }
    assert_redirected_to how_url(@how)
  end

  test "should destroy how" do
    assert_difference('How.count', -1) do
      delete how_url(@how)
    end

    assert_redirected_to hows_url
  end
end
