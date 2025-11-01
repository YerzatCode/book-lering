"use client";
import { supabase } from "@/api/supabase";
import { useState, useEffect } from "react";

export default function AdminPage() {
  const [courses, setCourses] = useState([]);
  const [courseId, setCourseId] = useState("");
  const [title, setTitle] = useState("");
  const [slug, setSlug] = useState("");
  const [content, setContent] = useState("");
  const [order, setOrder] = useState(1);
  const [message, setMessage] = useState("");
  const [type, setType] = useState("laboratory");

  useEffect(() => {
    async function loadCourses() {
      const { data } = await supabase.from("courses").select("*");
      setCourses(data);
    }
    loadCourses();
  }, []);

  async function createLesson() {
    const { error } = await supabase.from("lessons").insert({
      course_id: courseId,
      title,
      slug,
      content,
      order_pos: order,
      type,
    });

    if (error) setMessage(error.message);
    else {
      setMessage("Лекция добавлена ✅");
      setTitle("");
      setSlug("");
      setContent("");
    }
  }

  return (
    <div className="p-6 max-w-3xl mx-auto">
      <h1 className="text-3xl font-bold mb-6">Админ панель</h1>

      {message && <p className="p-2 bg-green-100 border mb-4">{message}</p>}

      <label>Выбери курс:</label>
      <select
        className="border p-2 w-full mb-3"
        value={courseId}
        onChange={(e) => setCourseId(e.target.value)}
      >
        <option value="">-- выбрать курс --</option>
        {courses.map((c) => (
          <option key={c.id} value={c.id}>
            {c.title}
          </option>
        ))}
      </select>
      <select
        className="border p-2 w-full mb-3"
        value={type}
        onChange={(e) => setType(e.target.value)}
      >
        <option value="lecture">Лекция</option>
        <option value="laboratory">Лаборотория</option>
      </select>

      <input
        className="border p-2 w-full mb-3"
        placeholder="Название лекции"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />

      <input
        className="border p-2 w-full mb-3"
        placeholder="slug (например intro-to-bigdata)"
        value={slug}
        onChange={(e) => setSlug(e.target.value)}
      />

      <input
        type="number"
        className="border p-2 w-full mb-3"
        placeholder="Порядок (1,2,3...)"
        value={order}
        onChange={(e) => setOrder(e.target.value)}
      />

      <textarea
        className="border p-2 w-full h-56 mb-3"
        placeholder="Вставь Markdown лекции"
        value={content}
        onChange={(e) => setContent(e.target.value)}
      />

      <button
        onClick={createLesson}
        className="bg-blue-600 text-white px-4 py-2 rounded"
      >
        ✅ Добавить лекцию
      </button>
    </div>
  );
}
