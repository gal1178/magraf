require 'test_helper'

class IntegralsControllerTest < ActionController::TestCase
  setup do
    @integral = integrals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:integrals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create integral" do
    assert_difference('Integral.count') do
      post :create, integral: {  }
    end

    assert_redirected_to integral_path(assigns(:integral))
  end

  test "should show integral" do
    get :show, id: @integral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @integral
    assert_response :success
  end

  test "should update integral" do
    put :update, id: @integral, integral: {  }
    assert_redirected_to integral_path(assigns(:integral))
  end

  test "should destroy integral" do
    assert_difference('Integral.count', -1) do
      delete :destroy, id: @integral
    end

    assert_redirected_to integrals_path
  end
end
