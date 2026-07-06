import type { SVGProps } from "react";

/**
 * Custom church glyph from the prototype — kept as an inline SVG so its
 * silhouette stays consistent across markers, list tiles, and heroes.
 */
export function ChurchIcon({
  strokeWidth = 1.8,
  ...props
}: SVGProps<SVGSVGElement> & { strokeWidth?: number }) {
  return (
    <svg
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth={strokeWidth}
      strokeLinecap="round"
      strokeLinejoin="round"
      {...props}
    >
      <path d="M12 2v5M10 4h4" />
      <path d="M5 21V10l7-3.5 7 3.5v11" />
      <path d="M10 21v-4h4v4" />
    </svg>
  );
}
