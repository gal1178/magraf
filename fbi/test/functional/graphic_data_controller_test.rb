require 'test_helper'

class GraphicDataControllerTest < ActionController::TestCase
  setup do
    @graphic_datum = graphic_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graphic_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graphic_datum" do
    assert_difference('GraphicDatum.count') do
      post :create, graphic_datum: { filename: @graphic_datum.filename }
    end

    assert_redirected_to graphic_datum_path(assigns(:graphic_datum))
  end

  test "should show graphic_datum" do
    get :show, id: @graphic_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @graphic_datum
    assert_response :success
  end

  test "should update graphic_datum" do
    put :update, id: @graphic_datum, graphic_datum: { filename: @graphic_datum.filename }
    assert_redirected_to graphic_datum_path(assigns(:graphic_datum))
  end

  test "should destroy graphic_datum" do
    assert_difference('GraphicDatum.count', -1) do
      delete :destroy, id: @graphic_datum
    end

    assert_redirected_to graphic_data_path
  end
end
