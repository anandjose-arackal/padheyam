"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { Bell, Bookmark, Map as MapIcon, User } from "lucide-react";
import { ChurchIcon } from "@/components/church-icon";
import { cn } from "@/lib/utils";

type NavItem = {
  href: string;
  label: string;
  icon: React.ComponentType<{
    className?: string;
    strokeWidth?: number;
    fill?: string;
  }>;
  /** Extra path prefixes that should mark this item active. */
  match?: string[];
};

const ITEMS: NavItem[] = [
  { href: "/", label: "Map", icon: MapIcon, match: ["/church"] },
  { href: "/search", label: "Churches", icon: ChurchIcon },
  { href: "/saved", label: "Saved", icon: Bookmark },
  { href: "/alerts", label: "Alerts", icon: Bell },
  { href: "/profile", label: "Profile", icon: User },
];

export function BottomNav() {
  const pathname = usePathname();

  // Hidden on the church details screen (matches the prototype).
  if (pathname.startsWith("/church/")) return null;

  return (
    <nav className="absolute inset-x-0 bottom-0 z-[60] px-4 pb-6 pt-2.5">
      <div className="glass flex h-16 items-center justify-around rounded-3xl shadow-[0_16px_40px_-16px_rgba(30,40,70,0.4)]">
        {ITEMS.map((item) => {
          const active =
            item.href === "/"
              ? pathname === "/" || (item.match?.some((m) => pathname.startsWith(m)) ?? false)
              : pathname === item.href || pathname.startsWith(item.href + "/");
          const Icon = item.icon;
          return (
            <Link
              key={item.href}
              href={item.href}
              className={cn(
                "flex h-full flex-1 flex-col items-center justify-center gap-1 transition-colors",
                active ? "text-ink-2" : "text-muted-2",
              )}
            >
              <Icon
                className="size-6"
                strokeWidth={1.9}
                fill={item.label === "Saved" && active ? "currentColor" : "none"}
              />
              <span className="text-[10px] font-semibold">{item.label}</span>
            </Link>
          );
        })}
      </div>
    </nav>
  );
}
