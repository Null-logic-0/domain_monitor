require "test_helper"

class DomainMailerTest < ActionMailer::TestCase
  test "available" do
    domain = domains(:available)
    email = DomainMailer.with(domain: domain).available
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [ domain.user.email_address ], email.to
  end

  test "expires_soon" do
    domain = domains(:expires_soon)
    email = DomainMailer.with(domain: domain).expires_soon
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal [ domain.user.email_address ], email.to
  end
end
