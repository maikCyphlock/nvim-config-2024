return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
  local wk = require('which-key')
 local builtin = require('telescope.builtin')

   --vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
   --vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
   --vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
   --vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    wk.register({
      f = {
        name = 'Telescope',
        f = { '<cmd>Telescope find_files<cr>','find files'},
        g = { '<cmd>Telescope live_grep<cr>','live grep'},
        b = { '<cmd>Telescope buffers<cr>','buffers'},
        h = { '<cmd>Telescope help_tags<cr>','help tags'},

  },prefix = '<leader>'
    })

 end
}
