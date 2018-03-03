require 'test_helper'

class CostFunctionTest < ActiveSupport::TestCase

  setup do
    @hypothesis = LinearRegression::Hypothesis.new(1, 1)
    @training_set = [
      [1, 2],
      [2, 3],
      [3, 4]
    ]
    @cost_function = LinearRegression::CostFunction.new(
      @hypothesis, @training_set
    )
  end

  test "should calculate accuracy" do
    accuracy = @cost_function.accuracy
    assert_equal 0, accuracy
  end

end
