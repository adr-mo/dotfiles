vim.api.nvim_create_user_command("Database", function()
	vim.cmd([[ :tabedit Database | DBUIToggle ]])
end, {
	desc = "Open Database",
})

-- Copie le fichier courant vers un container avec input interactif
vim.api.nvim_create_user_command("DockerCpTo", function()
  local file_abs = vim.fn.expand("%:p")     -- chemin absolu du fichier courant
  local file_rel = vim.fn.expand("%:.")     -- chemin relatif
  if file_abs == "" then
    print("Aucun fichier ouvert")
    return
  end
  local default = "centreon-app:/usr/share/centreon/" .. file_rel
  local container_path = vim.fn.input("Destination (container:/path): ", default)
  if container_path == "" then
    print("Opération annulée")
    return
  end
  vim.cmd("!" .. "docker cp " .. vim.fn.shellescape(file_abs) .. " " .. container_path)
end, { nargs = 0 })
