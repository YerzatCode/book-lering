import { supabase } from "@/api/supabase";
import { AlertCircle, CheckCircle } from "lucide-react";
import React from "react";

async function ResultPage({ params }) {
  const { resultId } = await params;

  const { data: result } = await supabase
    .from("test_results")
    .select()
    .eq("id", resultId)
    .single();

  return (
    <div>
      <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100 p-6">
        <div className="max-w-2xl mx-auto">
          <div className="bg-white rounded-xl shadow-lg p-8">
            <div className="text-center mb-8">
              {result?.score > 14 ? (
                <CheckCircle className="w-20 h-20 text-green-500 mx-auto mb-4" />
              ) : (
                <AlertCircle className="w-20 h-20 text-red-500 mx-auto mb-4" />
              )}

              <h2 className="text-3xl font-bold text-gray-800 mb-2">
                {result?.passed ? "Тест пройден!" : "Тест не пройден"}
              </h2>
              <p className="text-gray-600">
                Интеллектуальные системы и Big Data
              </p>
            </div>

            <div className="bg-gray-50 rounded-lg p-6 mb-6">
              <div className="grid grid-cols-3 gap-4 text-center">
                <div>
                  <div className="text-3xl font-bold text-indigo-600">
                    {result?.score}
                  </div>
                  <div className="text-sm text-gray-600">Правильных</div>
                </div>
                <div>
                  <div className="text-3xl font-bold text-gray-700">
                    {result?.total_questions}
                  </div>
                  <div className="text-sm text-gray-600">Всего</div>
                </div>
                <div>
                  <div
                    className={`text-3xl font-bold ${
                      result?.passed ? "text-green-600" : "text-red-600"
                    }`}
                  >
                    {result?.percentage}%
                  </div>
                  <div className="text-sm text-gray-600">Результат</div>
                </div>
              </div>
            </div>

            <div className="flex gap-4">
              {/* <button
                onClick={() => {}}
                className="flex-1 px-6 py-3 rounded-lg bg-indigo-600 text-white hover:bg-indigo-700 transition-colors"
              >
                Выбрать другой тест
              </button>
              <button
                onClick={() => {}}
                className="flex-1 px-6 py-3 rounded-lg bg-gray-300 text-gray-700 hover:bg-gray-400 transition-colors"
              >
                Пройти заново
              </button> */}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default ResultPage;
