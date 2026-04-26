_: {
  plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
          "aa" = "@parameter.outer";
          "ia" = "@parameter.inner";
          "ai" = "@conditional.outer";
          "ii" = "@conditional.inner";
          "al" = "@loop.outer";
          "il" = "@loop.inner";
          "ab" = "@block.outer";
          "ib" = "@block.inner";
          "as" = "@statement.outer";
          "is" = "@statement.outer";
          "aC" = "@comment.outer";
          "iC" = "@comment.inner";
        };
        selection_modes = {
          "@parameter.outer" = "v";
          "@function.outer" = "V";
          "@class.outer" = "V";
        };
        include_surrounding_whitespace = true;
      };
      move = {
        enable = true;
        set_jumps = true;
        goto_next_start = {
          "]f" = "@function.outer";
          "]c" = "@class.outer";
          "]o" = "@loop.outer";
          "]s" = "@statement.outer";
          "]a" = "@parameter.outer";
          "]k" = "@conditional.outer";
        };
        goto_next_end = {
          "]F" = "@function.outer";
          "]C" = "@class.outer";
          "]O" = "@loop.outer";
          "]A" = "@parameter.outer";
          "]K" = "@conditional.outer";
        };
        goto_previous_start = {
          "[f" = "@function.outer";
          "[c" = "@class.outer";
          "[o" = "@loop.outer";
          "[s" = "@statement.outer";
          "[a" = "@parameter.outer";
          "[k" = "@conditional.outer";
        };
        goto_previous_end = {
          "[F" = "@function.outer";
          "[C" = "@class.outer";
          "[O" = "@loop.outer";
          "[A" = "@parameter.outer";
          "[K" = "@conditional.outer";
        };
      };
      swap = {
        enable = true;
        swap_next = {
          "]p" = "@parameter.inner";
        };
        swap_previous = {
          "[p" = "@parameter.inner";
        };
      };
    };
  };
}
