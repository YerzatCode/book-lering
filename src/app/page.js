"use client";
import { supabase } from "@/api/supabase";
import React, { useEffect, useState } from "react";
import useAuth from "@/hooks/useAuth";
import { useRouter } from "next/navigation";
import Signup from "@/components/auth/Signup";
import { Toaster } from "sonner";
import Login from "@/components/auth/LoginForm";
export default function Home() {
  const { user, loading } = useAuth();
  const [loginPage, setLoginPage] = useState(true);
  const router = useRouter();

  if (!loading && user) {
    router.replace("/courses");
    return null;
  }

  return (
    <main className="w-full h-full">
      <Toaster position="top-right" />

      {loading ? <h1>Loading...</h1> : !loginPage ? <Signup /> : <Login />}
    </main>
  );
}
