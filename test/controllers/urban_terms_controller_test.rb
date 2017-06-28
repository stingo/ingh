require 'test_helper'

class UrbanTermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @urban_term = urban_terms(:one)
  end

  test "should get index" do
    get urban_terms_url
    assert_response :success
  end

  test "should get new" do
    get new_urban_term_url
    assert_response :success
  end

  test "should create urban_term" do
    assert_difference('UrbanTerm.count') do
      post urban_terms_url, params: { urban_term: { description: @urban_term.description, inaction: @urban_term.inaction, postcover: @urban_term.postcover, title: @urban_term.title } }
    end

    assert_redirected_to urban_term_url(UrbanTerm.last)
  end

  test "should show urban_term" do
    get urban_term_url(@urban_term)
    assert_response :success
  end

  test "should get edit" do
    get edit_urban_term_url(@urban_term)
    assert_response :success
  end

  test "should update urban_term" do
    patch urban_term_url(@urban_term), params: { urban_term: { description: @urban_term.description, inaction: @urban_term.inaction, postcover: @urban_term.postcover, title: @urban_term.title } }
    assert_redirected_to urban_term_url(@urban_term)
  end

  test "should destroy urban_term" do
    assert_difference('UrbanTerm.count', -1) do
      delete urban_term_url(@urban_term)
    end

    assert_redirected_to urban_terms_url
  end
end
