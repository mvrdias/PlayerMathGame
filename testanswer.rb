
class Question

  def initialize
    @numb1 = rand(1..20)
    @numb2 = rand(1..20)
  end

  def answer_is_correct?(answer)
    @numb1 + @numb2 === answer
  end

  def question_text
    "what is #{@numb1} + #{@numb2}?"
  end

  def ask_player(player)
    "#{player.name}, #{question_text}"
  end

end
