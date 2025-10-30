import React from "react";

function Input({ type, placeholder }) {
  return (
    <input
      type={type}
      placeholder={placeholder}
      className="w-[300px] h-[40px] rounded-sm p-2"
    />
  );
}

export default Input;
