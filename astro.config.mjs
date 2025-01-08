// @ts-check
import { defineConfig } from 'astro/config';

import preact from "@astrojs/preact";

import mdx from "@astrojs/mdx";

// https://astro.build/config
export default defineConfig({
  prefetch: {
    prefetchAll: true
  },
  scopedStyleStrategy: "attribute",
  integrations: [preact(), mdx()],
});