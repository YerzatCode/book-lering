import { supabase } from "@/api/supabase";
import Sidebar from "@/components/layout/Sidebar";
import Link from "next/link";
import React from "react";
import ReactMarkdown from "react-markdown";
import rehypeHighlight from "rehype-highlight";

async function Lesson({ params }) {
  const { lessonId, id } = await params;

  const { data: lesson } = await supabase
    .from("lessons")
    .select("*")
    .eq("id", lessonId)
    .single();

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
    <>
      <Sidebar
        id={id}
        laboratory={laboratory}
        course={course}
        lectures={lectures}
      />
      <div className="px-9 max-w-5xl mx-auto mt-10 max-lg:p-2">
        <header className="grid grid-cols-10  mb-4">
          <div className="w-16 h-16 gradient rounded-2xl flex items-center justify-center font-bold text-3xl">
            {lesson?.title[0]}
          </div>
          <div className="flex flex-col justify-between col-span-9 ">
            <h2 className="text-2xl font-bold">{lesson?.title}</h2>
            <p className="text-base text-[#696969]">{lesson?.slug}</p>
          </div>
        </header>

        <article className="prose prose-lg max-w-none card">
          <ReactMarkdown rehypePlugins={[rehypeHighlight]}>
            {lesson?.content}
          </ReactMarkdown>
        </article>
      </div>
    </>
  );
}

export default Lesson;
