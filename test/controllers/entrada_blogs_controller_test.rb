require 'test_helper'

class EntradaBlogsControllerTest < ActionController::TestCase
  setup do
    @entrada_blog = entrada_blogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrada_blogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrada_blog" do
    assert_difference('EntradaBlog.count') do
      post :create, entrada_blog: { body: @entrada_blog.body, imagen: @entrada_blog.imagen, otro1: @entrada_blog.otro1, otro2: @entrada_blog.otro2, titulo: @entrada_blog.titulo }
    end

    assert_redirected_to entrada_blog_path(assigns(:entrada_blog))
  end

  test "should show entrada_blog" do
    get :show, id: @entrada_blog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entrada_blog
    assert_response :success
  end

  test "should update entrada_blog" do
    patch :update, id: @entrada_blog, entrada_blog: { body: @entrada_blog.body, imagen: @entrada_blog.imagen, otro1: @entrada_blog.otro1, otro2: @entrada_blog.otro2, titulo: @entrada_blog.titulo }
    assert_redirected_to entrada_blog_path(assigns(:entrada_blog))
  end

  test "should destroy entrada_blog" do
    assert_difference('EntradaBlog.count', -1) do
      delete :destroy, id: @entrada_blog
    end

    assert_redirected_to entrada_blogs_path
  end
end
