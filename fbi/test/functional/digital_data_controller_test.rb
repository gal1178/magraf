require 'test_helper'

class DigitalDataControllerTest < ActionController::TestCase
  setup do
    @digital_datum = digital_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:digital_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create digital_datum" do
    assert_difference('DigitalDatum.count') do
      post :create, digital_datum: { filename: @digital_datum.filename }
    end

    assert_redirected_to digital_datum_path(assigns(:digital_datum))
  end

  test "should show digital_datum" do
    get :show, id: @digital_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @digital_datum
    assert_response :success
  end

  test "should update digital_datum" do
    put :update, id: @digital_datum, digital_datum: { filename: @digital_datum.filename }
    assert_redirected_to digital_datum_path(assigns(:digital_datum))
  end

  test "should destroy digital_datum" do
    assert_difference('DigitalDatum.count', -1) do
      delete :destroy, id: @digital_datum
    end

    assert_redirected_to digital_data_path
  end
end
