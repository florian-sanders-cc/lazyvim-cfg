{
    programs.alacritty = {
        enable = true;
        settings = {
          window.decorations = "none";
          window.dimensions.columns = 120;
          window.dimensions.lines = 30;
          window.padding.x = 15;
          window.padding.y = 15;
          key_bindings = [
            {
              key = "Q";
              mods = "Control";
              action = "Quit";
            }
            {
              key = "N";
              mods = "Control";
              action = "SpawnNewInstance";
            }
          ];
          font.size = 15;
        };
      };
}