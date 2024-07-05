-- Directory	The file path
-- Number	Line and column numbers
-- DiagnosticSignError	The default highlight group for error signs
-- DiagnosticSignWarn	The default highlight group for warning signs
-- DiagnosticSignInfo	The default highlight group for info signs
-- DiagnosticSignHint	The default highlight group for hint signs
return {
  'yorickpeterse/nvim-pqf',
  event = 'VeryLazy',
  config = function()
    require('pqf').setup()
  end
}
