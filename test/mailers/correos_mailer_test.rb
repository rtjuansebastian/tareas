require 'test_helper'

class CorreosMailerTest < ActionMailer::TestCase
  test "notificar" do
    mail = CorreosMailer.notificar
    assert_equal "Notificar", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
