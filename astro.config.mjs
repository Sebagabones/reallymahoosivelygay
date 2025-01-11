// @ts-check
import { defineConfig } from 'astro/config';

import preact from "@astrojs/preact";

import mdx from "@astrojs/mdx";

import astroExpressiveCode, { ExpressiveCodeTheme } from 'astro-expressive-code'

import fs from 'node:fs';

import node from '@astrojs/node';

import sitemap from '@astrojs/sitemap';

// const jsoncStringDark = fs.readFileSync(new URL(`./dark.jsonc`, import.meta.url), 'utf-8')
// const dark = ExpressiveCodeTheme.fromJSONString(jsoncStringDark)
// const jsoncStringLight = fs.readFileSync(new URL(`./light.jsonc`, import.meta.url), 'utf-8')
// const light = ExpressiveCodeTheme.fromJSONString(jsoncStringLight)
const jsoncStringDark = fs.readFileSync(new URL(`./tokyonightdark.jsonc`, import.meta.url), 'utf-8')
const dark = ExpressiveCodeTheme.fromJSONString(jsoncStringDark)
const jsoncStringLight = fs.readFileSync(new URL(`./tokyonightlight.jsonc`, import.meta.url), 'utf-8')
const light = ExpressiveCodeTheme.fromJSONString(jsoncStringLight)
// https://astro.build/config
export default defineConfig({
  site: 'https://mahoosively.gay',
  prefetch: {
    prefetchAll: true
  },

  scopedStyleStrategy: "attribute",

  integrations: [preact(), astroExpressiveCode({
    themes: [dark, light],
    // themes: ['catppuccin-latte', 'catppuccin-mocha', "catppuccin-macchiato", 'tokyo-night', 'material-theme-palenight'],
    minSyntaxHighlightingColorContrast: 0,
    useThemedSelectionColors: true,
    
    styleOverrides: {
      // You can also override styles
      borderRadius: '0.5rem',
      borderWidth: '2px',
      codeFontFamily: "JetBrains Mono",
      uiFontFamily: 'Fira Code'
    }
  
    
  }), mdx(), sitemap()],

  adapter: node({
    mode: 'standalone',
  }),
});
