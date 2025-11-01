import { supabase } from "@/api/supabase";
import Link from "next/link";
import React from "react";
import ReactMarkdown from "react-markdown";
import rehypeHighlight from "rehype-highlight";

async function Course({ params }) {
  const { id } = await params;
  const { data: course } = await supabase
    .from("courses")
    .select("*")
    .eq("id", id)
    .single();

  const { data: lectures } = await supabase
    .from("lessons")
    .select("")
    .eq("course_id", id)
    .eq("type", "lecture")
    .order("order_pos", { ascending: true });

  const { data: laboratory } = await supabase
    .from("lessons")
    .select("")
    .eq("course_id", id)
    .eq("type", "laboratory")
    .order("order_pos", { ascending: true });

  return (
    <div className="p-6">
      <h1 className="text-3xl font-bold">{course?.title}</h1>
      <article className="prose prose-lg max-w-none ">
        <ReactMarkdown rehypePlugins={[rehypeHighlight]}>
          {course?.description}
        </ReactMarkdown>
      </article>
      <h2 className="text-2xl font-semibold mb-4">Лекции</h2>

      <ul className="space-y-3">
        {lectures?.map((lesson, index) => (
          <li key={lesson.id}>
            <Link
              className="block hover:bg-gray-100 pl-3 text-blue-500 text-xl"
              href={`/courses/course/${id}/lesson/${lesson.id}`}
            >
              <span>{index + 1}. </span>
              {lesson.title}
            </Link>
          </li>
        ))}
      </ul>
      <h2 className="text-2xl font-semibold mb-4 mt-5">Лаборотория</h2>

      <ul className="space-y-3">
        {laboratory?.map((lesson, index) => (
          <li key={lesson.id}>
            <Link
              className="block hover:bg-gray-100 pl-3 text-blue-500 text-xl"
              href={`/courses/course/${id}/lesson/${lesson.id}`}
            >
              <span>{index + 1}. </span>
              {lesson.title}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
  0;
}

export default Course;
