return {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'eslint.config.js', 'eslint.config.mjs', 'eslint.config.cjs', 'eslint.config.ts', '.eslintrc.js', '.eslintrc.json', '.eslintrc', 'package.json' },
  settings = {
    validate = 'on',
    nodePath = vim.NIL,
    rulesCustomizations = {},
    run = 'onType',
    useFlatConfig = true,
    experimental = { useFlatConfig = true },
    codeAction = {
      disableRuleComment = { enable = true, location = 'separateLine' },
      showDocumentation = { enable = true },
    },
  },
}
