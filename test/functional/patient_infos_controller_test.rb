require 'test_helper'

class PatientInfosControllerTest < ActionController::TestCase
  setup do
    @patient_info = patient_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_info" do
    assert_difference('PatientInfo.count') do
      post :create, :patient_info => @patient_info.attributes
    end

    assert_redirected_to patient_info_path(assigns(:patient_info))
  end

  test "should show patient_info" do
    get :show, :id => @patient_info.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @patient_info.to_param
    assert_response :success
  end

  test "should update patient_info" do
    put :update, :id => @patient_info.to_param, :patient_info => @patient_info.attributes
    assert_redirected_to patient_info_path(assigns(:patient_info))
  end

  test "should destroy patient_info" do
    assert_difference('PatientInfo.count', -1) do
      delete :destroy, :id => @patient_info.to_param
    end

    assert_redirected_to patient_infos_path
  end
end
