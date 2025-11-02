import { createClient } from "@supabase/supabase-js";

export const supabase = createClient(
  process.env.NEXT_PUBLIC_SUPABASE_URL,
  process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
);

async function getTestCategories() {
  const { data } = await supabase.from("test_categories").select("");

  return data;
}

async function createResult(categoryId, answers) {
  // 1. Проверка авторизации
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user)
    return (
      {
        error: "Unauthorized",
      },
      {
        status: 401,
      }
    );

  // 2. Создание начального результата теста
  // NOTE: score и percentage должны быть вставлены (например, как 0)
  //       потому что они объявлены как NOT NULL в вашей схеме
  const { data: testResult, error: testErr } = await supabase
    .from("test_results")
    .insert({
      user_id: user.id,
      category_id: categoryId,
      // Вставляем 0, так как NOT NULL. Финальное значение будет позже
      score: 0,
      total_questions: Object.keys(answers).length,
      // Вставляем 0, так как NOT NULL. Финальное значение будет позже
      percentage: 0,
    })
    .select()
    .single();

  if (testErr) {
    console.error("❌ Failed to create test_result", testErr);
    return (
      {
        error: testErr.message,
      },
      {
        status: 500,
      }
    );
  }

  let correctCount = 0;
  const totalQuestions = Object.keys(answers).length;
  const userAnswersInserts = [];

  // 3. Обработка ответов пользователя и подсчет правильных
  for (const [question_id, selected_answer_id] of Object.entries(answers)) {
    // Получаем правильность варианта ответа
    const { data: correct } = await supabase
      .from("answers")
      .select("is_correct")
      .eq("id", selected_answer_id)
      .single();

    const isCorrect = correct?.is_correct || false;

    if (isCorrect) correctCount++;

    // Накапливаем данные для пакетной вставки в user_answers
    userAnswersInserts.push({
      test_result_id: testResult.id,
      question_id,
      selected_answer_id,
      is_correct: isCorrect,
    });
  }

  // 4. Пакетная вставка всех ответов пользователя (оптимизация)
  const { error: userAnswersErr } = await supabase
    .from("user_answers")
    .insert(userAnswersInserts);

  if (userAnswersErr) {
    console.error("❌ Failed to insert user_answers", userAnswersErr);
    // Возможно, стоит удалить test_result, если user_answers не вставились
  }

  // 5. Расчет финального результата
  const percentage =
    totalQuestions > 0 ? (correctCount / totalQuestions) * 100 : 0;

  // 6. Обновление результата (score и percentage)
  await supabase
    .from("test_results")
    .update({
      score: correctCount,
      percentage,
    })
    .eq("id", testResult.id);

  // 7. Возврат результата
  return {
    resultId: testResult.id,
  };
}
export { getTestCategories, createResult };
