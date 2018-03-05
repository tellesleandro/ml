require 'test_helper'

class LeastSquareTest < ActiveSupport::TestCase

  setup do
    training_set = [
      [1, 2],
      [2, 3],
      [3, 4]
    ]
    @least_square = LinearRegression::LeastSquare.new(training_set)
  end

  test "should find the parameters" do
    teta_0, teta_1 = @least_square.parameters
    assert_equal 1, teta_0
    assert_equal 1, teta_1
  end

end
