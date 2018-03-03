module LinearRegression

  class CostFunction

    def initialize(hypothesis, training_set)
      @hypothesis = hypothesis
      @training_set = training_set
    end

    # Calculate de accuracy of the cost function
    def accuracy

      # Sum and square the error (difference) between predicted Y and actual Y
      summarization = @training_set.sum{|x, y| @hypothesis.error(x, y) ** 2}

      # Calculate the average of the errors
      (1.to_f / (2 * @training_set.length)) * summarization
      
    end

  end

end
