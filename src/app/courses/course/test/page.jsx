"use client";
import { getTestCategories } from "@/api/supabase";
import Link from "next/link";
import React, { useEffect, useState } from "react";

function TestPage({ params }) {
  const [testCategories, setTestCategories] = useState([]);
  useEffect(() => {
    getTestCategories().then((res) => {
      setTestCategories(res);
    });
  }, []);
  return (
    <div className="p-6">
      {testCategories?.map((item) => (
        <div className="card flex flex-col gap-4" key={item.id}>
          <h3 className="text-xl font-bold">{item.name}</h3>
          <Link
            href={`/courses/course/test/${item.id}`}
            className="w-full bg-blue-400 text-center font-bold p-2 text-lg rounded-md text-white hover:bg-blue-300 duration-200"
          >
            Проити тест
          </Link>
        </div>
      ))}
    </div>
  );
}

export default TestPage;
