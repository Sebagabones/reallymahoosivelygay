// @ts-check
import { defineConfig } from 'astro/config';

import mdx from "@astrojs/mdx";

import astroExpressiveCode, { ExpressiveCodeTheme } from 'astro-expressive-code'

import fs from 'node:fs';

import node from '@astrojs/node';

import sitemap from '@astrojs/sitemap';

import react from '@astrojs/react';

import { toString } from 'hast-util-to-string'

import { h } from 'hastscript'


import autolinkHeadings from 'rehype-autolink-headings'

// const jsoncStringDark = fs.readFileSync(new URL(`./dark.jsonc`, import.meta.url), 'utf-8')
// const dark = ExpressiveCodeTheme.fromJSONString(jsoncStringDark)
// const jsoncStringLight = fs.readFileSync(new URL(`./light.jsonc`, import.meta.url), 'utf-8')
// const light = ExpressiveCodeTheme.fromJSONString(jsoncStringLight)
const jsoncStringDark = fs.readFileSync(new URL(`./tokyonightdark.jsonc`, import.meta.url), 'utf-8')
const dark = ExpressiveCodeTheme.fromJSONString(jsoncStringDark)
const jsoncStringLight = fs.readFileSync(new URL(`./tokyonightlight.jsonc`, import.meta.url), 'utf-8')
const light = ExpressiveCodeTheme.fromJSONString(jsoncStringLight)
// https://astro.build/config
const createSROnlyLabel = (text) => {
  const node = h('span.sr-only', `Section titled ${escape(text)}`)
  node.properties['is:raw'] = true
  return node
}

export default defineConfig({
  site: 'https://mahoosively.gay',
  prefetch: {
    prefetchAll: true
  },

  scopedStyleStrategy: "attribute",

  integrations: [astroExpressiveCode({
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
  
    
  }), mdx(), sitemap(), react()],

  adapter: node({
    mode: 'standalone',
  }),
});
