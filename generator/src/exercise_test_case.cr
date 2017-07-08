abstract class ExerciseTestCase
  abstract def workload
  abstract def test_name

  def pending?(index)
    index == 0 ? "it" : "pending"
  end
end
