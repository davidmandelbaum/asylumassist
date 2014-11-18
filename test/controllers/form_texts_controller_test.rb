require 'test_helper'

class FormTextsControllerTest < ActionController::TestCase
  setup do
    @form_text = form_texts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_text" do
    assert_difference('FormText.count') do
      post :create, form_text: { guidance: @form_text.guidance, page_id: @form_text.page_id, seq_no: @form_text.seq_no }
    end

    assert_redirected_to form_text_path(assigns(:form_text))
  end

  test "should show form_text" do
    get :show, id: @form_text
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_text
    assert_response :success
  end

  test "should update form_text" do
    patch :update, id: @form_text, form_text: { guidance: @form_text.guidance, page_id: @form_text.page_id, seq_no: @form_text.seq_no }
    assert_redirected_to form_text_path(assigns(:form_text))
  end

  test "should destroy form_text" do
    assert_difference('FormText.count', -1) do
      delete :destroy, id: @form_text
    end

    assert_redirected_to form_texts_path
  end
end
