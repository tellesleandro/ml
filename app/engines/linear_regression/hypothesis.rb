module LinearRegression

  class Hypothesis

    def initialize(teta_0, teta_1)
      @teta_0, @teta_1 = teta_0, teta_1
    end

    # Predict the value of Y for the hypothesis function based on given X
    def predict_value(x)
      @teta_0 + @teta_1 * x
    end

    # Predict the error (difference) of predicted Y and the actual Y
    def error(x, y)
      predict_value(x) - y
    end

  end

end
