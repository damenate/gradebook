require 'test_helper'

class LoginLogoutTest < ActionDispatch::IntegrationTest
  test 'login page works' do
    get teachers_path
    assert_redirected_to login_path
    follow_redirect! #(must say that you want to follow the redirect with this command)
    assert_template "new" #(without the follow_redirect! it wouldn't show the template(view))

    post login_path, sessions: {email:"gibberish@blah.com", password:"alsdkfj"}
    assert_redirected_to login_path
    post login_path, sessions: {email:"brucelee@water.com", password:"brucelee"}
    assert_redirected_to teachers_path
    follow_redirect!
    assert_select "tr", 2
  end
  test "can create students" do
    post login_path, sessions: {email:"damenatekim@awesome.com", password:"damekim"}
    post students_path, student: {name: "", email: "", password: ""}
  end
end
