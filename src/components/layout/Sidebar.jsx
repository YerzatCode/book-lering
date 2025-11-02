"use client";
import Link from "next/link";
import React from "react";

function Sidebar({ id, lectures, course, laboratory }) {
  const [open, setOpen] = React.useState(false);
  return (
    <>
      <button
        onClick={() => setOpen(!open)}
        className="fixed top-3 left-3 z-50 px-3 py-2 text-2xl md:hidden "
      >
        ☰
      </button>
      <nav
        className={`
          absolute 
          h-auto
          overflow-y-scroll
          top-0 
          w-64 
          flex
          flex-col
          gap-2 
          z-10 
          duration-300 
          lg:left-5
          max-lg:bg-white 
          mb-20
          max-lg:fixed 
          max-lg:top-17 
          max-lg:h-full 
          max-lg:w-full
          max-lg:p-5 
         ${open ? "left-0" : "-left-full"}`}
      >
        <Link
          className="text-blue-600 font-bold text-2xl"
          href={`/courses/course/${id}`}
        >
          {course.title}
        </Link>

        <div className="nav_card">
          <h4 className="font-bold text-[#1e293b] border-b border-slate-300 py-2">
            Лекция
          </h4>
          <div className="flex flex-col gap-2">
            {lectures?.map((item) => (
              <Link
                href={`/courses/course/${id}/lesson/${item?.id}`}
                key={item?.id}
                className="nav_item"
              >
                {item?.title}
              </Link>
            ))}
          </div>
        </div>

        <div className="nav_card">
          <h4 className="font-bold text-[#1e293b] border-b border-slate-300 py-2">
            Лаборотория
          </h4>
          <div className="flex flex-col gap-2">
            {laboratory?.map((lab) => (
              <Link
                href={`/courses/course/${id}/lesson/${lab.id}`}
                key={lab?.id}
                className="nav_item"
              >
                {lab?.title}
              </Link>
            ))}
          </div>
        </div>
        <h4 className="nav_card flex">
          <Link
            href={`/courses/course/test`}
            className="bg-blue-400 rounded-md text-white p-2 w-full text-center font-semibold"
          >
            Проити тест
          </Link>
        </h4>
        <h4 className="nav_card mb-10">__________________________</h4>
      </nav>
    </>
  );
}

export default Sidebar;
