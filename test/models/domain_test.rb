require "test_helper"

class DomainTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "available?" do
    assert domains(:available).available?
    refute domains(:expires_soon).available?
    refute domains(:expires_later).available?
  end

  test "expires_soon?" do
    assert domains(:expires_soon).expires_soon?
    refute domains(:available).expires_soon?
    refute domains(:expires_later).expires_soon?
  end

  test "sends an email when the domain is becomes available" do
    domain = domains(:expires_soon)
    domain.update(expires_at: nil)
    assert_enqueued_emails 1
    assert_enqueued_email_with DomainMailer, :available, params: { domain: domain }
  end
end
