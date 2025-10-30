"use client";
import { AuthProvider } from "@/components/context/AuthProvider";
import "./globals.css";
import { Toaster } from "sonner";

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className="w-full h-screen">
        <AuthProvider>{children}</AuthProvider>
      </body>
    </html>
  );
}
