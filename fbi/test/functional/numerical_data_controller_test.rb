require 'test_helper'

class NumericalDataControllerTest < ActionController::TestCase
  setup do
    @numerical_datum = numerical_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:numerical_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create numerical_datum" do
    assert_difference('NumericalDatum.count') do
      post :create, numerical_datum: { filename: @numerical_datum.filename }
    end

    assert_redirected_to numerical_datum_path(assigns(:numerical_datum))
  end

  test "should show numerical_datum" do
    get :show, id: @numerical_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @numerical_datum
    assert_response :success
  end

  test "should update numerical_datum" do
    put :update, id: @numerical_datum, numerical_datum: { filename: @numerical_datum.filename }
    assert_redirected_to numerical_datum_path(assigns(:numerical_datum))
  end

  test "should destroy numerical_datum" do
    assert_difference('NumericalDatum.count', -1) do
      delete :destroy, id: @numerical_datum
    end

    assert_redirected_to numerical_data_path
  end
end
