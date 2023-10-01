require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    defaults = {
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
	  grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
	  qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    },
  }
}

require('telescope').load_extension('fzf')
