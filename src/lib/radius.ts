/** Escalating search-radius tiers (km) offered when nothing is found nearby. */
export const RADIUS_TIERS = [10, 25, 50] as const;

/** The next wider tier after `current`, or `null` if already past the widest. */
export function nextRadiusTier(current: number): number | null {
  const next = RADIUS_TIERS.find((tier) => tier > current);
  return next ?? null;
}
