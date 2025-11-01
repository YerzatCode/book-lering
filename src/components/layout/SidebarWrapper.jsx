"use client";
import { useState } from "react";
import dynamic from "next/dynamic";

const Sidebar = dynamic(() => import("./Sidebar"), { ssr: true });

export default function SidebarWrapper({ id }) {
  const [open, setOpen] = useState(false);

  return (
    <>
      <button
        onClick={() => setOpen(!open)}
        className="fixed top-3 left-3 z-50 bg-white px-3 py-2 border rounded shadow md:hidden"
      >
        ☰
      </button>

      <div
        className={`
           top-0 left-0 h-full bg-white shadow-lg z-40 p-4
          transform transition-transform duration-300
          ${open ? "translate-x-0" : "-translate-x-full"}
          md:translate-x-0 md:static md:block
        `}
      >
        <Sidebar id={id} />
      </div>

      {/* затемнение фона при открытом меню */}
      {open && (
        <div
          className="fixed inset-0 bg-black opacity-40 z-30 md:hidden"
          onClick={() => setOpen(false)}
        ></div>
      )}
    </>
  );
}
