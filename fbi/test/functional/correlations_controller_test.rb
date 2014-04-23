require 'test_helper'

class CorrelationsControllerTest < ActionController::TestCase
  setup do
    @correlation = correlations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:correlations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create correlation" do
    assert_difference('Correlation.count') do
      post :create, correlation: {  }
    end

    assert_redirected_to correlation_path(assigns(:correlation))
  end

  test "should show correlation" do
    get :show, id: @correlation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @correlation
    assert_response :success
  end

  test "should update correlation" do
    put :update, id: @correlation, correlation: {  }
    assert_redirected_to correlation_path(assigns(:correlation))
  end

  test "should destroy correlation" do
    assert_difference('Correlation.count', -1) do
      delete :destroy, id: @correlation
    end

    assert_redirected_to correlations_path
  end
end
