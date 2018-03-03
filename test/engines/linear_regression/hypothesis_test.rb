require 'test_helper'

class HypothesisTest < ActiveSupport::TestCase

  setup do
    @hypothesis = LinearRegression::Hypothesis.new(1, 1)
  end

  test "should predict value for x" do
    prediction = @hypothesis.predict_value(1)
    assert_equal 2, prediction
  end

  test "should calculate the error" do
    error = @hypothesis.error(1, 2)
    assert_equal 0, error
  end

end
