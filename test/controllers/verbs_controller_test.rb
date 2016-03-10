require 'test_helper'

class VerbsControllerTest < ActionController::TestCase
  setup do
    @verb = verbs(:haben)
    
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:verbs)
  end

  test "should create verb" do
    assert_difference('Verb.count') do
      post :create, verb: { english: @verb.english, future: @verb.future, german: @verb.german, past: @verb.past, past_verb_helper: @verb.past_verb_helper, spanish: @verb.spanish, type: @verb.type }
    end

    assert_response 201
  end

  test "should show verb" do
    get :show, id: @verb
    assert_response :success
  end

  test "should update verb" do
    put :update, id: @verb, verb: { english: @verb.english, future: @verb.future, german: @verb.german, past: @verb.past, past_verb_helper: @verb.past_verb_helper, spanish: @verb.spanish, type: @verb.type }
    assert_response 204
  end

  test "should destroy verb" do
    assert_difference('Verb.count', -1) do
      delete :destroy, id: @verb
    end

    assert_response 204
  end

  test 'should get ten random verbs' do
    get :ten_random
    assert_equal 10, assigns(:verbs).count , 'Not getting 10 random verbs'
  end

end
