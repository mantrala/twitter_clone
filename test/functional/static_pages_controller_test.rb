require_relative '../test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def test_home
    get :home
    assert_response(:success, :template => "home")
    assert_select('h1', 'Welcome to Twitter Clone')
    assert_select('title', 'TwitterClone | Home')
  end

  def test_help
    get :help
    assert_response(:success, :template => "help")
    assert_select('h1', 'Help')
    assert_select('title', 'TwitterClone | Help')
  end

  def test_about
    get :about
    assert_response(:success, :template => "about")
    assert_select('h1', 'About Us')
    assert_select('title', 'TwitterClone | About Us')
  end

  def test_contact
    get :contact
    assert_response(:success, :template => "contact")
    assert_select("h1", "Contact")
    assert_select('title', 'TwitterClone | Contact')
  end
end