import { supabase } from "@/api/supabase";
import React from "react";
import TestPage from "./TestPage";

async function Questions({ params }) {
  const { id } = await params;
  const { data, error } = await supabase.rpc("get_random_questions", {
    cat_id: id,
  }).select(`
    id,
    question_text,
    answers(id, answer_text)
  `);
  return <TestPage questions={data} categoryId={id} />;
}

export default Questions;
