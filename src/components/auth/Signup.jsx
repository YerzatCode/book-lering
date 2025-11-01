import React from "react";
import Input from "../ui/Input";
import Button from "../ui/Button";
import { toast } from "sonner";
import { supabase } from "@/api/supabase";
import Link from "next/link";

function Signup({ setLogin }) {
  const handleSignup = async (e) => {
    e.preventDefault();
    const email = e.target[0].value;
    const password = e.target[1].value;
    console.log(email, " - ", password);

    if (!email || !password) {
      toast.error("Please enter email and password");
      return;
    }
    const { data, error } = await supabase.auth.signUp({
      email,
      password,
    });
    if (error) {
      return toast.error("Ошибка при создание аккаунта");
    }
    if (data) {
      return toast.success("Успешно создан аккаунт! Проверь почту");
    }
  };
  return (
    <div className="container m-auto h-full">
      <form
        onSubmit={handleSignup}
        className="flex flex-col justify-center items-center h-full gap-2"
      >
        <h2 className="text-2xl font-bold">Создать аккаунт</h2>
        <p className="opacity-70">Создай аккаунт чтобы войти</p>
        <Input type="email" placeholder="Почта" />
        <Input type="password" placeholder="Пароль" />
        <Button>Создать аккаунт</Button>
        <span>
          Перейти чтобы войти в{" "}
          <a
            href="#"
            onClick={() => {
              setLogin(true);
            }}
            className="text-blue-500"
          >
            аккаунт
          </a>
          .
        </span>
      </form>
    </div>
  );
}

export default Signup;
