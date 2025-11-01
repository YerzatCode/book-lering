import React from "react";

function Button({ children }) {
  return (
    <button
      className="w-[300px] h-[40px] p-2 bg-blue-500 text-white font-bold rounded-sm"
      type="submit"
    >
      {children}
    </button>
  );
}

export default Button;
