
-- -- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

-- -- =======================
-- -- Variables
-- -- =======================

-- local cmd = vim.cmd                  -- to execute Vim commands e.g. cmd('pwd')
-- local fn = vim.fn                    -- to call Vim functions e.g. fn.bufnr()
-- local g = vim.g                      -- a table to access global variables
-- local opt = vim.opt                  -- to set options
-- local map = vim.api.nvim_set_keymap  -- alias to map

-- -- =======================
-- -- Boostrap
-- -- =======================

-- local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

-- if fn.empty(fn.glob(install_path)) > 0 then
--   fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
-- end

-- -- =======================
-- -- Package manager
-- -- =======================

-- require "paq" {
--   -- Package manager
--   'savq/paq-nvim';

--   -- Vim better defaults
--   'liuchengxu/vim-better-default';

--   -- Fuzzy search
--   'nvim-lua/plenary.nvim';
--   'nvim-telescope/telescope.nvim';

--   -- Icons
--   'kyazdani42/nvim-tree.lua';

--   -- Highlighting
--   {'nvim-treesitter/nvim-treesitter', run = fn[':TSUpdate']};
--   'nvim-treesitter/playground';

--   -- File explorer
--   'kyazdani42/nvim-web-devicons';

--   -- Status line
--   'hoob3rt/lualine.nvim';
--   -- 'ryanoasis/vim-devicons';

--   -- Themes
--   'shaunsingh/nord.nvim';


--   -- "neovim/nvim-lspconfig";          -- Mind the semi-colons
--   -- 'hrsh7th/nvim-cmp';
--   -- "hrsh7th/nvim-compe";
-- }

-- -- =======================
-- -- Basic
-- -- =======================

-- vim.cmd('runtime! plugin/default.vim')

-- vim.g.mapleader = ' '
-- vim.opt.cursorline = false
-- vim.cmd[[colorscheme nord]]

-- -- vim.opt.termguicolors = true

-- -- =======================
-- -- Telescope - fuzzy search
-- -- =======================

-- map('n', '<Leader>pf', '<cmd>Telescope find_files<cr>', {noremap = true})
-- map('n', '<leader>pg', '<cmd>Telescope live_grep<cr>', {noremap = true})
-- map('n', '<leader>pb', '<cmd>Telescope buffers<cr>', {noremap = true})
-- map('n', '<leader>pt', '<cmd>Telescope help_tags<cr>', {noremap = true})

-- local actions = require('telescope.actions')
-- local telescope = require('telescope')

-- telescope.setup {
--   defaults = {
--     mappings = {
--       i = {
--         ["<C-j>"] = actions.move_selection_next,
--         ["<C-k>"] = actions.move_selection_previous,
--         ["<C-s>"] = actions.select_horizontal,
--         ["<C-v>"] = actions.select_vertical,
--         ["<Esc>"] = actions.close
--       }
--     }
--   }
-- }

-- -- =======================
-- -- Lualine - status line
-- -- =======================

-- require('lualine').setup()

-- -- =======================
-- -- Nvim tree - file explorer
-- -- =======================

-- map('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true})
-- map('n', '<leader>N', ':NvimTreeFindFile<CR>', {noremap = true})
-- -- nnoremap <leader>r :NvimTreeRefresh<CR>
-- -- " NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

-- -- =======================
-- -- Treesitter
-- -- =======================

-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
--   highlight = {
--     enable = true,              -- false will disable the whole extension
--     disable = { },              -- list of language that will be disabled
--   },
--   playground = {
--     enable = true,
--     disable = {},
--     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
--     persist_queries = false -- Whether the query persists across vim sessions
--   },
--   rainbow = {
--     enable = true
--   }
-- }

-- -- require("nvim-treesitter.parsers").elixir = {
-- --   install_info = {
-- --     url = "$HOME/treesitter/tree-sitter-elixir/",
-- --     files = "grammar.js"
-- --   },
-- --   used_by = {'elixir'}
-- -- }
