-- Various generic vim settings
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = false
vim.opt.cindent = true
vim.opt.preserveindent = true
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.incsearch = true
vim.opt.mouse = ""
vim.opt.splitkeep = "screen"
vim.opt.signcolumn = 'auto:2'
-- vim.cmd.colorscheme("tokyo-metro")

-- Install vim-plug if not present
local vim_plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(vim_plug_path)) > 0 then
  vim.fn.system({
    'curl', '-fLo', vim_plug_path, '--create-dirs',
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  })
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- ALE configs
vim.lsp.enable('solargraph')
vim.g.ale_virtualtext_cursor = 'disabled'
vim.g.ale_cursor_detail = 1
vim.g.ale_floating_preview = 1
vim.g.ale_detail_to_floating_preview = 1
vim.g.ale_floating_window_border = {'│', '─', '╭', '╮', '╯', '╰'}
vim.g.ale_sign_column_always = 1
vim.g.ale_completion_enabled = 1
vim.g.ale_ruby_rubocop_options = '--fail-level warning --display-only-fail-level-offenses'
vim.g.ale_linters = {
  rust = {'analyzer'},
  ruby = {'rubocop'},
  python = {'flake8'},
  yaml = {'actionlint'},
}
vim.g.ale_rust_analyzer_config = {
  checkOnSave = {
    command = 'clippy',
    enable = true
  },
  inlayHints = {
    typeHints = true,
    parameterHints = true
  }
}
vim.g.ale_python_flake8_options = '--max-line-length=120'
-- vim.g.ale_ruby_rubocop_executable = 'bundle'
vim.g.ale_fixers = {
  rust = {'rustfmt', 'remove_trailing_lines'},
  python = {'black'},
  ruby = {'rubocop'},
}
vim.g.ale_ruby_solargraph_executable = 'solargraph'
vim.g.ale_ruby_solargraph_options = {}

vim.opt.completeopt = {'menu', 'menuone', 'preview', 'noselect', 'noinsert'}
vim.g.ctrlp_user_command = {'.git', 'cd %s && git ls-files -co --exclude-standard'}

-- Duh, plugins
local Plug = vim.fn['plug#']
vim.call('plug#begin', vim.fn.stdpath('data') .. '/plugged')
Plug('https://github.com/airblade/vim-gitgutter.git')
Plug('https://github.com/vim-airline/vim-airline.git')
Plug('https://github.com/vim-airline/vim-airline-themes.git')
Plug('https://github.com/tpope/vim-fugitive.git')
Plug('https://github.com/tpope/vim-commentary.git')
-- Plug('https://github.com/gregsexton/gitv.git')
Plug('davidhalter/jedi-vim')
Plug('https://github.com/ctrlpvim/ctrlp.vim.git')
Plug('junegunn/fzf', { dir = '~/.fzf', ['do'] = './install --bin' })
Plug('junegunn/fzf.vim')
Plug('dense-analysis/ale')
Plug('rust-lang/rust.vim')
Plug('jremmen/vim-ripgrep')
Plug('hashivim/vim-terraform')
Plug('vim-ruby/vim-ruby')
Plug('nvim-treesitter/nvim-treesitter')
Plug('https://github.com/neovim/nvim-lspconfig')
Plug('MeanderingProgrammer/render-markdown.nvim')
vim.call('plug#end')

-- Airline settings
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'jellybeans'
vim.opt.laststatus = 2
vim.opt.updatetime = 250

-- GitGutter remaps
vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)')
vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)')
vim.keymap.set('o', 'ih', '<Plug>GitGutterTextObjectInnerPending')
vim.keymap.set('o', 'ah', '<Plug>GitGutterTextObjectOuterPending')
vim.keymap.set('x', 'ih', '<Plug>GitGutterTextObjectInnerVisual')
vim.keymap.set('x', 'ah', '<Plug>GitGutterTextObjectOuterVisual')

-- Full text search remap
vim.keymap.set('n', '<Leader>rg', ':Rg ', { silent = true })
vim.keymap.set('x', '<Leader>rg', 'y:Rg <C-R>"<CR>', { silent = true })

-- SLIMV configs (commented out)
-- vim.g.slimv_impl = 'mit'
-- vim.g.slimv_lisp = '/usr/bin/scheme'
-- vim.g.scheme_builtin_swank = 'true'
-- vim.g.slimv_swank_cmd = "! screen -X eval 'title swank' 'screen scheme --eval \"(let loop () (start-swank) (loop))\"' 'select swank' &"

vim.g['airline#extensions#ale#enabled'] = 1
-- vim.cmd('autocmd BufRead,BufNewFile *.template.yaml set ft=cloudformation.yaml')
-- vim.cmd('autocmd BufNewFile,BufRead *.tf set syntax=tf')

vim.g.jedi_use_tabs_not_buffers = 1

-- LSP config for GitHub Actions
local util = require 'lspconfig.util'

local gha_lsp_config = {
  default_config = {
    cmd = { 'gh-actions-language-server', '--stdio' },
    filetypes = { 'yaml.github' },
    root_dir = util.root_pattern('.github'),
    single_file_support = true,
    capabilities = {
      workspace = {
        didChangeWorkspaceFolders = {
          dynamicRegistration = true,
        },
      },
    },
  },
  docs = {
    description = [[
https://github.com/lttb/gh-actions-language-server

Language server for GitHub Actions.

The server is registered for the special `yaml.github` filetype. You need to configure this filetype pattern for GitHub workflow files.

```lua
vim.filetype.add({
  pattern = {
    ['.*/%.github[%w/]+workflows[%w/]+.*%.ya?ml'] = 'yaml.github',
  },
})
```

`gh-actions-language-server` can be installed via `npm`:

```sh
npm install -g gh-actions-language-server
```
]],
  },
}

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
})
