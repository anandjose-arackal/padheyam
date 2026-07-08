"use client";

import { Cross, MapPin } from "lucide-react";
import { useLocation } from "@/lib/location-context";

const DUST_PARTICLES = [
  { top: "10%", left: "18%", size: 3, delay: "0s" },
  { top: "16%", left: "72%", size: 2, delay: "0.6s" },
  { top: "22%", left: "40%", size: 2.5, delay: "1.2s" },
  { top: "8%", left: "55%", size: 2, delay: "1.8s" },
  { top: "28%", left: "12%", size: 3, delay: "2.4s" },
  { top: "34%", left: "82%", size: 2, delay: "0.3s" },
  { top: "18%", left: "30%", size: 2, delay: "3s" },
  { top: "40%", left: "65%", size: 2.5, delay: "1.5s" },
  { top: "12%", left: "85%", size: 2, delay: "2.1s" },
  { top: "45%", left: "20%", size: 2, delay: "3.6s" },
  { top: "6%", left: "38%", size: 2.5, delay: "4.2s" },
  { top: "38%", left: "48%", size: 2, delay: "0.9s" },
];

export function LocationGate() {
  const { showGate, requestLocation, dismissGate, requesting } = useLocation();

  if (!showGate) return null;

  return (
    <div className="absolute inset-0 z-[90] flex animate-[fadeIn_0.4s_ease] flex-col justify-end overflow-hidden bg-[linear-gradient(180deg,#FAFBFC_0%,#F6FAFD_25%,#DFF3FF_55%,#9FD4FF_80%,#5DA9F6_100%)]">
      {/* sunrise glow */}
      <div className="pointer-events-none absolute inset-0 [background:radial-gradient(55%_40%_at_50%_8%,rgba(255,247,232,0.9),rgba(234,203,122,0.25)_45%,transparent_75%)]" />

      {/* volumetric sun rays */}
      <svg
        className="pointer-events-none absolute left-1/2 top-[-6%] size-[420px] -translate-x-1/2 animate-[spin_36s_linear_infinite] opacity-25"
        viewBox="0 0 200 200"
        fill="none"
      >
        <defs>
          <linearGradient id="rayGradient" x1="0" y1="0" x2="1" y2="0">
            <stop offset="0%" stopColor="#EACB7A" stopOpacity="0" />
            <stop offset="100%" stopColor="#FFF7E8" stopOpacity="0.9" />
          </linearGradient>
        </defs>
        {Array.from({ length: 16 }).map((_, i) => {
          const angle = (i * Math.PI) / 8;
          return (
            <line
              key={i}
              x1="100"
              y1="100"
              x2={100 + 95 * Math.cos(angle)}
              y2={100 + 95 * Math.sin(angle)}
              stroke="url(#rayGradient)"
              strokeWidth="2.5"
              strokeLinecap="round"
            />
          );
        })}
      </svg>

      {/* gothic arch silhouettes framing the edges */}
      <svg
        className="pointer-events-none absolute -left-6 top-0 h-full w-[90px] opacity-[0.08]"
        viewBox="0 0 80 400"
        preserveAspectRatio="none"
        fill="none"
      >
        <path
          d="M14,400 L14,140 Q14,40 40,40 Q66,40 66,140 L66,400"
          stroke="#FFF7E8"
          strokeWidth="3"
        />
      </svg>
      <svg
        className="pointer-events-none absolute -right-6 top-0 h-full w-[90px] opacity-[0.08]"
        viewBox="0 0 80 400"
        preserveAspectRatio="none"
        fill="none"
      >
        <path
          d="M14,400 L14,140 Q14,40 40,40 Q66,40 66,140 L66,400"
          stroke="#FFF7E8"
          strokeWidth="3"
        />
      </svg>

      {/* right-side partial cathedral, misted */}
      <svg
        className="pointer-events-none absolute right-[-22%] top-[6%] h-[46%] opacity-[0.12]"
        viewBox="0 0 200 400"
        fill="none"
      >
        <path
          d="M100,10 L64,150 L136,150 Z M50,150 L50,400 L150,400 L150,150"
          fill="#5DA9F6"
        />
        <circle
          cx="100"
          cy="230"
          r="34"
          stroke="#FFF7E8"
          strokeWidth="2.5"
          fill="none"
        />
        {Array.from({ length: 8 }).map((_, i) => {
          const angle = (i * Math.PI) / 4;
          return (
            <line
              key={i}
              x1="100"
              y1="230"
              x2={100 + 30 * Math.cos(angle)}
              y2={230 + 30 * Math.sin(angle)}
              stroke="#FFF7E8"
              strokeWidth="1.5"
            />
          );
        })}
      </svg>
      <div className="pointer-events-none absolute right-[-10%] top-0 h-[55%] w-[45%] bg-white/40 blur-3xl" />

      {/* stained-glass color blooms */}
      <div className="pointer-events-none absolute right-[6%] top-[14%] size-[90px] rounded-full bg-[#5DA9F6]/25 blur-2xl" />
      <div className="pointer-events-none absolute right-[18%] top-[24%] size-[70px] rounded-full bg-[#EACB7A]/30 blur-2xl" />
      <div className="pointer-events-none absolute right-[10%] top-[30%] size-[60px] rounded-full bg-[#8C3B45]/10 blur-2xl" />

      {/* left-side dove with olive branch */}
      <svg
        className="pointer-events-none absolute left-[10%] top-[16%] size-[70px] animate-float-gentle opacity-80"
        viewBox="0 0 70 50"
        fill="none"
      >
        <path
          d="M8,32 Q2,28 0,22 Q6,24 10,28 Q16,18 28,14 Q40,10 50,16 Q42,18 36,24 Q44,26 50,32 Q40,32 32,36 Q22,40 14,36 Q10,34 8,32 Z"
          fill="#FFFFFF"
          style={{ filter: "drop-shadow(0 0 10px rgba(255,255,255,0.6))" }}
        />
        <path
          d="M50,16 L58,12"
          stroke="#EACB7A"
          strokeWidth="1.5"
          strokeLinecap="round"
        />
        <circle cx="59" cy="11" r="2" fill="#EACB7A" />
        <circle cx="62" cy="14" r="1.6" fill="#EACB7A" />
      </svg>

      {/* floating dust particles */}
      {DUST_PARTICLES.map((p, i) => (
        <span
          key={i}
          className="pointer-events-none absolute animate-dust-float rounded-full bg-[#FFF7E8]"
          style={{
            top: p.top,
            left: p.left,
            width: p.size,
            height: p.size,
            animationDelay: p.delay,
          }}
        />
      ))}

      {/* bottom frosted glass waves */}
      <div className="pointer-events-none absolute inset-x-0 bottom-0 h-[160px] backdrop-blur-md">
        <svg
          className="absolute inset-x-0 bottom-0 h-full w-full"
          viewBox="0 0 360 160"
          preserveAspectRatio="none"
        >
          <defs>
            <linearGradient id="waveGradient" x1="0" y1="0" x2="0" y2="1">
              <stop offset="0%" stopColor="#9FD4FF" stopOpacity="0" />
              <stop offset="100%" stopColor="#5DA9F6" stopOpacity="0.35" />
            </linearGradient>
          </defs>
          <path
            d="M0,70 C60,30 120,90 180,60 C240,30 300,80 360,55 L360,160 L0,160 Z"
            fill="url(#waveGradient)"
          />
        </svg>
      </div>

      <div className="relative flex flex-1 flex-col items-center justify-center px-9 text-center">
        {/* sunburst + pulsing halo behind the cross */}
        <div className="relative mb-8 flex size-24 items-center justify-center">
          <span className="absolute inset-0 rounded-full bg-white/40 animate-ring-pulse" />
          <span
            className="absolute inset-0 rounded-full bg-white/40 animate-ring-pulse"
            style={{ animationDelay: "1.2s" }}
          />

          <div className="relative flex size-24 items-center justify-center rounded-full bg-[linear-gradient(160deg,#f7c6d9,#f2829e)] shadow-[0_0_60px_10px_rgba(242,130,158,0.45)]">
            <Cross className="size-11 text-gold-ink" strokeWidth={1.6} />
          </div>
        </div>

        <span className="mb-2 text-[11px] font-bold uppercase tracking-[3px] text-[#2d4a68]/60">
          Padheyam
        </span>
        <h1 className="font-display text-[32px] font-semibold leading-[1.15] tracking-[-0.5px] text-[#1e2a44]">
          Wherever You Are,
          <br />
          Jesus Is Near
        </h1>
        <p className="mt-4 max-w-[300px] text-[15px] leading-relaxed text-[#4a5f7a]">
          Share your location and we&apos;ll guide you to the nearest Mass,
          Adoration, and Confession — right when you need it.
        </p>
        <p className="mt-5 max-w-[270px] text-[12.5px] italic leading-relaxed text-[#5a7290]">
          &ldquo;Where two or three gather in my name, there am I with
          them.&rdquo;
          <span className="mt-1 block not-italic tracking-[0.5px]">
            — Matthew 18:20
          </span>
        </p>
      </div>

      <div className="relative flex flex-col gap-3 px-6 pb-12">
        <button
          onClick={requestLocation}
          disabled={requesting}
          className="flex h-[58px] w-full items-center justify-center gap-2.5 rounded-[20px] bg-[linear-gradient(160deg,#f7c6d9,#f2829e)] text-base font-bold text-gold-ink shadow-[0_16px_36px_-12px_rgba(242,130,158,0.7)] disabled:opacity-70"
        >
          <MapPin className="size-5" strokeWidth={2} />
          {requesting ? "Locating…" : "Allow Location"}
        </button>
        <button
          onClick={dismissGate}
          className="h-[54px] w-full rounded-[20px] border border-[#5DA9F6]/20 bg-white/50 text-[15px] font-semibold text-[#2d4a68] backdrop-blur-sm"
        >
          Not Now
        </button>
      </div>
    </div>
  );
}
