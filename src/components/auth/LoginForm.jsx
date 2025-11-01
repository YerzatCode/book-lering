import React from "react";
import Input from "../ui/Input";
import Button from "../ui/Button";
import { toast } from "sonner";
import { supabase } from "@/api/supabase";

function Login({ setLogin }) {
  const handleSignin = async (e) => {
    e.preventDefault();
    const email = e.target[0].value;
    const password = e.target[1].value;
    console.log(email, " - ", password);

    if (!email || !password) {
      toast.error("Please enter email and password");
      return;
    }
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });
    if (data) {
      toast.success("Success. Please login now");
    }
    if (error) {
      toast.error("Unable to sign up. Please try again");
    }
  };
  return (
    <div className="container m-auto h-full">
      <form
        onSubmit={handleSignin}
        className="flex flex-col justify-center items-center h-full gap-2 "
      >
        <h2 className="text-2xl font-bold">Войти в систему</h2>
        <p className="opacity-70">Система для обучения студентов.</p>
        <Input type="email" placeholder="Email" />
        <Input type="password" placeholder="Password" />
        <Button>Войти</Button>
        <span>
          Перейти чтобы{" "}
          <a
            href="#"
            onClick={() => {
              setLogin(false);
            }}
            className="text-blue-500"
          >
            создать
          </a>{" "}
          аккаунт.
        </span>
      </form>
    </div>
  );
}

export default Login;
