import React from "react";
import Input from "../ui/Input";
import Button from "../ui/Button";
import { toast } from "sonner";
import { supabase } from "@/api/supabase";

function Signup() {
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
        onSubmit={handleSignup}
        className="flex flex-col justify-center items-center h-full gap-2"
      >
        <Input type="email" placeholder="Email" />
        <Input type="password" placeholder="Password" />
        <Button>Создать аккаунт</Button>
      </form>
    </div>
  );
}

export default Signup;
