{
  plugins.mini.modules.starter = {
    content_hooks = {
      "__unkeyed-1.adding_bullet" = {
        __raw = "require('mini.starter').gen_hook.adding_bullet()";
      };
      "__unkeyed-2.indexing" = {
        __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions', 'Plugins' })";
      };
      "__unkeyed-3.padding" = {
        __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
      };
    };
    evaluate_single = true;
    header = ''
                                                   
            ████ ██████           █████      ██
           ███████████             █████ 
           █████████ ███████████████████ ███   ███████████
          █████████  ███    █████████████ █████ ██████████████
         █████████ ██████████ █████████ █████ █████ ████ █████
       ███████████ ███    ███ █████████ █████ █████ ████ █████
      ██████  █████████████████████ ████ █████ █████ ████ ██████
    '';
    items = {
      "__unkeyed-1.buildtin_actions" = {
        __raw = "require('mini.starter').sections.builtin_actions()";
      };
      "__unkeyed-2.plugins" = [
        {
          name = "Oil";
          action = "Oil";
          section = "Plugins";
        }
      ];
      "__unkeyed-3.recent_files_current_directory" = {
        __raw = "require('mini.starter').sections.recent_files(8, false)";
      };
      "__unkeyed-4.recent_files" = {
        __raw = "require('mini.starter').sections.recent_files(8, true)";
      };
      "__unkeyed-5.sessions" = {
        __raw = "require('mini.starter').sections.sessions(4, true)";
      };
    };
  };
}
