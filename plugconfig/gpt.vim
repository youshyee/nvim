
" ===
" === gpt.vim
" ===
"

lua <<EOF
-- chat gpt
require("gpt").setup({
      api_key = os.getenv("OPENAI_API_KEY")
    })
  opts = { silent = true, noremap = true }
  vim.keymap.set('v', '<C-g>r', require('gpt').replace, {
    silent = true,
    noremap = true,
    desc = "[G]pt [R]ewrite"
  })
  vim.keymap.set('v', '<C-g>p', require('gpt').visual_prompt, {
    silent = false,
    noremap = true,
    desc = "[G]pt [P]rompt"
  })
  vim.keymap.set('v', '<C-g>g', require('gpt').visual_grammar, {
    silent = false,
    noremap = true,
    desc = "[G]pt [P]rompt"
  })
  vim.keymap.set('v', '<C-g>c', require('gpt').visual_grammarcheck, {
    silent = false,
    noremap = true,
    desc = "[G]pt [P]rompt"
  })
  vim.keymap.set('v', '<C-g>w', require('gpt').visual_rewrite, {
    silent = false,
    noremap = true,
    desc = "[G]pt [P]rompt"
  })
  vim.keymap.set('v', '<C-g>W', require('gpt').visual_rewrite4, {
    silent = false,
    noremap = true,
    desc = "[G]pt [P]rompt"
  })
  vim.keymap.set('n', '<C-g>p', require('gpt').prompt, {
    silent = true,
    noremap = true,
    desc = "[G]pt [P]rompt"
  })
  vim.keymap.set('n', '<C-g>c', require('gpt').cancel, {
    silent = true,
    noremap = true,
    desc = "[G]pt [C]ancel"
  })
  vim.keymap.set('i', '<C-g>p', require('gpt').prompt, {
    silent = true,
    noremap = true,
    desc = "[G]pt [P]rompt"
  })
EOF

