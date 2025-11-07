import { supabase } from "@/api/supabase";
import Link from "next/link";
import React from "react";

async function Dashbord() {
  const { data: courses, error } = await supabase.from("courses").select("*");
  return (
    <div className="p-6">
      <h1 className="text-3xl font-bold mb-4">Учебники</h1>

      {error && <p>Ошибка: {error.message}</p>}

      <ul className="grid grid-cols-3 max-md:grid-cols-1 max-lg:grid-cols-2">
        {courses?.map((c) => (
          <li key={c.id} className="card gap-4 flex flex-col justify-between">
            <div>
              <h2 className="font-semibold text-2xl">{c.title}</h2>
              {/* <p>{c.description}</p> */}
            </div>
            <Link
              className="block font-bold text-xl text-white hover:bg-[#41adff] w-full bg-[#1c9dff] rounded-2xl text-center p-3"
              href={`/courses/course/${c.id}`}
            >
              Перейти
            </Link>
            <p>Автор: Пазылханов Ерзат</p>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default Dashbord;
