# frozen_string_literal: true

require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get blogs_url
    assert_response :success
  end

  test 'should show blog' do
    @blog = blogs(:one)

    get blog_url(@blog)
    assert_response :success
  end
end
