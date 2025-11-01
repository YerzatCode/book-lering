"use client";
import React from "react";
import Link from "next/link";
import useAuth from "@/hooks/useAuth";
import { supabase } from "@/api/supabase";
import { useRouter } from "next/navigation";

function Header({ courses }) {
  const { user, loading } = useAuth();
  const [open, setOpen] = React.useState(false);
  const router = useRouter();

  if (!loading && !user) {
    router.replace("/");
    return null;
  }

  const logout = async () => {
    return await supabase.auth.signOut();
  };

  return (
    <header className="w-full bg_gradient px-6 py-2 sticky top-0 z-20">
      <nav className="container flex justify-between m-auto items-center relative max-lg:justify-end">
        <ul className="flex gap-10 items-center z-10 max-lg:hidden">
          {courses?.map((course) => (
            <li key={course?.id}>
              <Link
                className="cursor-pointer"
                href={`/courses/course/${course.id}`}
              >
                {course?.title}
              </Link>
            </li>
          ))}
        </ul>

        <Link
          className="text-2xl font-bold absolute text-center w-full max-sm:text-xl"
          href={"/courses"}
        >
          Мультимедийный учебник
        </Link>

        <div className="relative none-select">
          <div
            onClick={() => setOpen(!open)}
            className="w-13 h-13 bg-[#1c9dff] flex justify-center items-center text-2xl text-white font-bold  rounded-full hover:bg-[#0091ff] duration-300 uppercase cursor-pointer none-select"
          >
            {user?.email[0]}
          </div>
          <div
            className={`absolute w-48 top-15 right-0 z-10 bg-white p-2 drop-shadow-xl rounded-md ${
              open ? "" : "hidden"
            }`}
          >
            <button className="font-bold text-red-500" onClick={() => logout()}>
              Выход
            </button>
          </div>
        </div>
      </nav>
    </header>
  );
}

export default Header;
