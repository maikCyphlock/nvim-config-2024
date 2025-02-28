# 🚀 NVim maikCyphlock personal config 

![Neovim](https://img.shields.io/badge/Neovim-0.9+-57A143?style=flat&logo=neovim)
![License](https://img.shields.io/badge/License-MIT-blue)
![Plugins](https://img.shields.io/badge/Plugins-25+-orange)

Una configuración moderna de Neovim con énfasis en productividad y experiencia de desarrollo. Incluye las mejores herramientas y atajos para desarrollo web moderno.


## ✨ Características Principales

- 🎨 Temas: Catppuccin, Gruvbox
- ⚡ Rendimiento optimizado con Lazy.nvim
- 🧩 Soporte completo para LSP (Lua, TypeScript, HTML, CSS, Astro)
- 🔍 Búsqueda inteligente con Telescope
- 🗂️ Explorador de archivos con Neo-tree
- 🤖 Autocompletado AI con Codeium
- 💻 UI moderna con Lualine y Nvim-web-devicons
- 🛠️ Herramientas esenciales: Git, LazyGit, Treesitter, Autopairs
- ⌨️ Atajos intuitivos con Which-Key

## 🛠️ Instalación

1. **Requisitos:**
   - Neovim 0.9+
   - Node.js (para LSPs)
   - Git

2. **Instalar configuración:**
   ```bash
   git clone https://github.com/maikCyphlock/nvim-config-2024 ~/.config/nvim
   ```

3. **Iniciar Neovim:**
   ```bash
   nvim
   ```
   *Los plugins se instalarán automáticamente con Lazy.nvim*

## 🧩 Plugins Destacados

| Categoría       | Plugins                                                                 |
|-----------------|-------------------------------------------------------------------------|
| **UI**          | Lualine, Neo-tree, Catppuccin, Telescope                               |
| **Productividad** | Codeium, Trouble.nvim, Overseer, Which-Key                           |
| **LSP**         | Mason, nvim-lspconfig, null-ls, cmp-nvim-lsp                          |
| **Desarrollo**  | Treesitter, nvim-autopairs, Comment.nvim, Git.nvim                    |
| **Utilidades**  | LazyGit, Diffview, Notifier.nvim, Better-comments                     |

## ⌨️ Atajos Clave

### Globales
- `<space>`: comando combinador <leader>
- `<C-s>`: Guardar archivo
- `<C-q>`: Salir
- `<leader>e`: Alternar Neo-tree
- `<leader>g`: Estado de Git

### Telescope
- `<leader>ff`: Buscar archivos
- `<leader>fg`: Búsqueda en vivo
- `<leader>fb`: Búferes abiertos
- `<leader>fh`: Tags de ayuda

### LSP
- `<leader>lk`: Mostrar documentación
- `<leader>ld`: Ir a definición
- `<leader>ca`: Acciones de código

### Troubleshooting
- `<leader>xx`: Alternar Trouble.nvim
- `<leader>xq`: Quickfix list

## 🎨 Personalización

### Cambiar tema
1. Editar `lua/plugins/catppuccin.lua`
2. Modificar `flavour` (opciones: latte, frappe, macchiato, mocha)

```lua
require("catppuccin").setup({
  flavour = "mocha" -- Cambiar por el tema deseado
})
```

### Agregar plugins
1. Crear nuevo archivo en `lua/plugins/`
2. Añadir configuración del plugin
3. Ejecutar `:Lazy sync` en Neovim

## 🤝 Contribuir

¡Contribuciones son bienvenidas! 

1. Haz fork del repositorio
2. Crea una rama con tu feature (`git checkout -b feature/awesome-feature`)
3. Haz commit de tus cambios
4. Push a la rama
5. Abre un Pull Request
