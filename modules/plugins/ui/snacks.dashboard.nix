{
  plugins.snacks = {
    enable = true;
    settings.dashboard = {
      enabled = true;
      preset.keys = [
        {
          icon = "󱪞 ";
          key = "n";
          desc = "New File";
          action = ":ene | startinsert";
          gap = 1;
          padding = 1;
        }
        {
          icon = "󰱽 ";
          key = "f";
          desc = "Find File";
          action = "<cmd>lua Snacks.picker.files({ hidden = true })<cr>";
          gap = 1;
          padding = 1;
        }
        {
          icon = "󰺮 ";
          key = "g";
          desc = "Find Text";
          action = "<cmd>lua Snacks.picker.grep()<cr>";
          gap = 1;
          padding = 1;
        }
        {
          icon = "󰕁 ";
          title = "Recent Files";
          key = "r";
          action = "<cmd>lua Snacks.picker.recent()<cr>";
          section = "recent_files";
          indent = 2;
          padding = 1;
        }
        {
          icon = "󰝰 ";
          title = "Projects";
          key = "p";
          action = "<cmd>lua Snacks.picker.projects()<cr>";
          section = "projects";
          indent = 2;
          padding = 1;
        }
        {
          icon = "󰑓 ";
          key = "s";
          desc = "Restore Session";
          action = ":lua require('persistence').load()";
        }
        {
          icon = "󰈆 ";
          key = "q";
          desc = "Quit";
          action = ":qa";
          gap = 1;
          padding = 1;
        }
      ];

      preset.header = ''

                                                                             
              ████ ██████           █████      ██                      
             ███████████             █████                              
             █████████ ███████████████████ ███   ███████████    
            █████████  ███    █████████████ █████ ██████████████    
           █████████ ██████████ █████████ █████ █████ ████ █████    
         ███████████ ███    ███ █████████ █████ █████ ████ █████   
        ██████  █████████████████████ ████ █████ █████ ████ ██████  

      '';

      sections = [
        { section = "header"; }
        { section = "keys"; }
      ];
    };
  };
}
