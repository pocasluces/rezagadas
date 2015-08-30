require 'test_helper'

class TipoContenidosControllerTest < ActionController::TestCase
  setup do
    @tipo_contenido = tipo_contenidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_contenidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_contenido" do
    assert_difference('TipoContenido.count') do
      post :create, tipo_contenido: { astrofoto: @tipo_contenido.astrofoto, metematica: @tipo_contenido.metematica, otro1: @tipo_contenido.otro1, otro2: @tipo_contenido.otro2, otrotxt: @tipo_contenido.otrotxt }
    end

    assert_redirected_to tipo_contenido_path(assigns(:tipo_contenido))
  end

  test "should show tipo_contenido" do
    get :show, id: @tipo_contenido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_contenido
    assert_response :success
  end

  test "should update tipo_contenido" do
    patch :update, id: @tipo_contenido, tipo_contenido: { astrofoto: @tipo_contenido.astrofoto, metematica: @tipo_contenido.metematica, otro1: @tipo_contenido.otro1, otro2: @tipo_contenido.otro2, otrotxt: @tipo_contenido.otrotxt }
    assert_redirected_to tipo_contenido_path(assigns(:tipo_contenido))
  end

  test "should destroy tipo_contenido" do
    assert_difference('TipoContenido.count', -1) do
      delete :destroy, id: @tipo_contenido
    end

    assert_redirected_to tipo_contenidos_path
  end
end
