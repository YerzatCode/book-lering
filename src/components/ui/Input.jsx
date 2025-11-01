import React from "react";

function Input({ type, placeholder }) {
  return (
    <input
      type={type}
      placeholder={placeholder}
      className="w-[300px] h-[40px] bg-blue-300 rounded-sm p-2"
    />
  );
}

export default Input;
