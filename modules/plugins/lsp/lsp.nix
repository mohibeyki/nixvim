{
  config,
  lib,
  ...
}:
let
  enabledWithLsp = lib.filterAttrs (_: cfg: cfg.lsp != null) config.languages.enabledConfigs;
  lspServers = lib.mapAttrs' (
    _: cfg:
    lib.nameValuePair cfg.lsp (
      {
        enable = true;
        package = null;
      }
      // cfg.lspSettings
    )
  ) enabledWithLsp;
in
{
  filetype = {
    extension = {
      mdx = "markdown.mdx";
      gotmpl = "gotmpl";
    };
    pattern = {
      ".*docker-compose.*\\.ya?ml" = "yaml.docker-compose";
      "\\.gitlab-ci\\.ya?ml" = "yaml.gitlab";
      ".*/templates/.*\\.ya?ml" = "yaml.helm-values";
    };
  };

  plugins.lsp = {
    enable = true;
    inlayHints = true;

    servers = lspServers;
  };

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end

        local buf = args.buf
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
        end

        local function supports(method)
          return client:supports_method(method, { bufnr = buf })
        end

        local code_actions = client.server_capabilities.codeActionProvider
        local code_action_kinds = type(code_actions) == "table" and code_actions.codeActionKinds or nil
        local function supports_kind(prefix)
          if not code_actions then
            return false
          end
          if not code_action_kinds then
            return prefix == "source"
          end
          for _, kind in ipairs(code_action_kinds) do
            if kind == prefix or vim.startswith(kind, prefix .. ".") then
              return true
            end
          end
          return false
        end

        if supports("textDocument/signatureHelp") then
          map("n", "gK", vim.lsp.buf.signature_help, "Signature Help")
          map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
        end

        if supports("textDocument/codeLens") then
          map({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, "Run Codelens")
          map("n", "<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
        end

        if supports("textDocument/codeAction") and supports_kind("source") then
          map("n", "<leader>cA", function()
            vim.lsp.buf.code_action({
              context = {
                only = { "source" },
                diagnostics = {},
              },
              apply = true,
            })
          end, "Source Action")
        end

        if supports("textDocument/codeAction") and supports_kind("source.organizeImports") then
          map("n", "<leader>co", function()
            vim.lsp.buf.code_action({
              context = {
                only = { "source.organizeImports" },
                diagnostics = {},
              },
              apply = true,
            })
          end, "Organize Imports")
        end

        if supports("textDocument/prepareCallHierarchy") then
          map("n", "gai", vim.lsp.buf.incoming_calls, "Calls Incoming")
          map("n", "gao", vim.lsp.buf.outgoing_calls, "Calls Outgoing")
        end

        if supports("textDocument/typeDefinition") then
          map("n", "gy", vim.lsp.buf.type_definition, "Type Definition")
        end

        if supports("textDocument/implementation") then
          map("n", "gi", vim.lsp.buf.implementation, "Implementation")
        end

        if supports("workspace/willRenameFiles") or supports("workspace/didRenameFiles") then
          map("n", "<leader>cR", function()
            Snacks.rename.rename_file()
          end, "Rename File")
        end

        if supports("textDocument/documentHighlight") and Snacks.words.is_enabled({ buf = buf, modes = false }) then
          map("n", "]]", function()
            Snacks.words.jump(vim.v.count1)
          end, "Next Reference")
          map("n", "[[", function()
            Snacks.words.jump(-vim.v.count1)
          end, "Prev Reference")
          map("n", "<A-n>", function()
            Snacks.words.jump(vim.v.count1, true)
          end, "Next Reference")
          map("n", "<A-p>", function()
            Snacks.words.jump(-vim.v.count1, true)
          end, "Prev Reference")
        end
      end,
    })

    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
      config = config or {}
      config.border = config.border or "rounded"
      return vim.lsp.handlers.hover(err, result, ctx, config)
    end

    vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
      config = config or {}
      config.border = config.border or "rounded"
      return vim.lsp.handlers.signature_help(err, result, ctx, config)
    end
  '';
}
