"use client";

import { useEffect, useState } from "react";

/**
 * A `Date` that updates on a fixed interval (default every minute) so
 * Mass statuses and countdowns stay live without manual refetching.
 */
export function useNow(intervalMs = 60_000): Date {
  const [now, setNow] = useState(() => new Date());
  useEffect(() => {
    const id = setInterval(() => setNow(new Date()), intervalMs);
    return () => clearInterval(id);
  }, [intervalMs]);
  return now;
}
