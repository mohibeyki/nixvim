_: {
  plugins.todo-comments = {
    enable = true;
    settings = {
      highlight = {
        before = "";
        keyword = "wide";
        after = "fg";
        pattern = "@?(KEYWORDS)";
      };
      keywords = {
        FIX = {
          icon = " ";
          color = "error";
          alt = [
            "FIXME"
            "BUG"
            "FIXIT"
            "ISSUE"
          ];
        };
        TODO = {
          icon = " ";
          color = "info";
          alt = [
            "TASK"
            "TO DO"
          ];
        };
        HACK = {
          icon = " ";
          color = "warning";
        };
        WARN = {
          icon = " ";
          color = "warning";
          alt = [
            "WARNING"
            "WARN"
            "ATTENTION"
            "ATTN"
          ];
        };
        PERF = {
          icon = " ";
          color = "default";
          alt = [
            "OPTIMIZE"
            "PERFORMANCE"
            "OPTIM"
          ];
        };
        NOTE = {
          icon = " ";
          color = "hint";
          alt = [
            "INFO"
            "NOTE"
            "REVIEW"
          ];
        };
        TEST = {
          icon = " ";
          color = "test";
          alt = [
            "TESTING"
            "PASSED"
            "FAILED"
          ];
        };
      };
      colors = {
        error = [
          "DiagnosticError"
          "ErrorMsg"
          "#DC2626"
        ];
        warning = [
          "DiagnosticWarn"
          "WarningMsg"
          "#FBBF24"
        ];
        info = [
          "DiagnosticInfo"
          "#2563EB"
        ];
        hint = [
          "DiagnosticHint"
          "#10B981"
        ];
        default = [
          "Identifier"
          "#7C3AED"
        ];
        test = [
          "Identifier"
          "#FF00FF"
        ];
      };
    };
  };
}
