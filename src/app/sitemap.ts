import type { MetadataRoute } from "next";
import { getChurches } from "@/lib/churches";
import { SITE_URL } from "@/lib/seo";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const churches = await getChurches();

  const churchEntries: MetadataRoute.Sitemap = churches.map((c) => ({
    url: `${SITE_URL}/church/${c.id}`,
    changeFrequency: "weekly",
    priority: 0.8,
  }));

  return [
    {
      url: SITE_URL,
      changeFrequency: "daily",
      priority: 1,
    },
    {
      url: `${SITE_URL}/search`,
      changeFrequency: "daily",
      priority: 0.6,
    },
    {
      url: `${SITE_URL}/about`,
      changeFrequency: "monthly",
      priority: 0.3,
    },
    ...churchEntries,
  ];
}
