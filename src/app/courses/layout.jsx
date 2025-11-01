import { supabase } from "@/api/supabase";
import Header from "@/components/layout/Header";
import React from "react";

async function BookLayout({ children }) {
  const { data: courses, error } = await supabase.from("courses").select("*");
  return (
    <>
      <Header courses={courses} />
      <main className="container mx-auto relative ">{children}</main>
    </>
  );
}

export default BookLayout;
