abstract class ExerciseTestCase
  abstract def workload
  abstract def test_name

  def pending?(index)
    index == 0 ? "it" : %q({{pending.id}})
  end
end
