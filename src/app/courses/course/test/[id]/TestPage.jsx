"use client";
import { createResult, supabase } from "@/api/supabase";
import Button from "@/components/ui/Button";
import useAuth from "@/hooks/useAuth";
import { useRouter } from "next/navigation";
import { useState } from "react";

export default function TestPage({ questions, categoryId }) {
  const [answers, setAnswers] = useState({});
  const router = useRouter();

  const selectAnswer = (questionId, answerId) => {
    setAnswers((prev) => ({ ...prev, [questionId]: answerId }));
  };

  const submitTest = async () => {
    const data = await createResult(categoryId, answers);
    if (data?.resultId) {
      return router.push(`/courses/course/test/result/${data.resultId}`);
    }
    return;
  };

  return (
    <div className="p-6">
      {questions.map((q, i) => (
        <div key={q.id} className="card flex flex-col ">
          <p className="text-lg font-semibold">
            {i + 1}. {q.question_text}
          </p>

          {q.answers.map((ans) => (
            <label key={ans.id} className="flex gap-2">
              <input
                type="radio"
                name={q.id}
                onChange={() => selectAnswer(q.id, ans.id)}
              />
              {ans.answer_text}
            </label>
          ))}
        </div>
      ))}
      <div className="mt-2 mb-10 flex w-full justify-center">
        <button
          onClick={submitTest}
          className="w-[300px] h-[40px] p-2 bg-blue-500 text-white font-bold rounded-sm"
        >
          Завершить
        </button>
      </div>
    </div>
  );
}
