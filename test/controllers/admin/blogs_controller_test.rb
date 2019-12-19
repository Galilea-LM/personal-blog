require 'test_helper'

class Admin::BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = users(:one)
    @blog = blogs(:one)
    sign_in user
  end

  test 'should get new' do
    get new_admin_blog_url
    assert_response :success
  end

  test 'should create blog' do
    assert_difference('Blog.count') do
      post admin_blogs_url, params: { blog: { description: @blog.description,
                                        published: @blog.published, reference: @blog.reference,
                                        tags: @blog.tags, title: "titulooo", user_id: @blog.user_id,
                                        rich_body: "rich body" } }
    end

    assert_redirected_to blogs_path
  end

  test 'should get edit' do
    get edit_admin_blog_path(@blog)
    assert_response :success
  end

  test 'should update blog' do
    patch admin_blog_path(@blog), params: { blog: { body: @blog.body, description: @blog.description,
                                             published: @blog.published, reference: @blog.reference,
                                             tags: @blog.tags, title: @blog.title, user_id: @blog.user_id } }
    assert_redirected_to blog_path(@blog)
  end

  test 'should destroy blog' do
    assert_difference('Blog.count', -1) do
      delete admin_blog_path(@blog)
    end

    assert_redirected_to blogs_path
  end
end
