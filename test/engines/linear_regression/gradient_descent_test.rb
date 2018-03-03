require 'test_helper'

class GradientDescentTest < ActiveSupport::TestCase

  setup do
    @training_set = [
      [1, 2],
      [2, 3],
      [3, 4]
    ]
    @gradient_descent = LinearRegression::GradientDescent.new(@training_set)
  end

  test "should find the parameters" do
    teta_0, teta_1 = @gradient_descent.parameters(0, 0, 0.3, 0.001)
    assert 0.99 < teta_0
    assert 0.99 < teta_1
  end

end
