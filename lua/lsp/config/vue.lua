local util = require 'lspconfig.util'

local function get_typescript_server_path(root_dir)
    local project_root = util.find_node_modules_ancestor(root_dir)

    local local_tsserverlib = project_root ~= nil and
                                  util.path
                                      .join(project_root, 'node_modules', 'typescript', 'lib', 'tsserverlibrary.js')
    local global_tsserverlib = '$NVM_DIR/versions/node/v14.19.0/lib/node_modules/typescript/lib/tsserverlibrary.js'

    if local_tsserverlib and util.path.exists(local_tsserverlib) then
        return local_tsserverlib
    else
        return global_tsserverlib
    end
end

local opts = {
    on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
    end,
    on_attach = function(client, bufnr)
      -- 禁用格式化功能，交给专门插件插件处理
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
      end
      -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
      -- 绑定快捷键
      -- keybindings.mapLSP(buf_set_keymap)
    end
}

return {
    on_ready = function(server)
        server:setup(opts)
    end
}
