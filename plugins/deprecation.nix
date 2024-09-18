{ lib, ... }:
let
  removed = {
    # Added 2023-08-29
    treesitter-playground = ''
      The `treesitter-playground` plugin has been deprecated since the functionality is included in Neovim.
      Use:
      - `:Inspect` to show the highlight groups under the cursor
      - `:InspectTree` to show the parsed syntax tree ("TSPlayground")
      - `:PreviewQuery` to open the Query Editor (Nvim 0.10+)
    '';
  };
  renamed = {
    # Added 2024-09-17
    surround = "vim-surround";
  };
in
{

  imports =
    (lib.mapAttrsToList (
      name:
      lib.mkRemovedOptionModule [
        "plugins"
        name
      ]
    ) removed)
    ++ (lib.mapAttrsToList (
      old: new:
      lib.mkRenamedOptionModule
        [
          "plugins"
          old
        ]
        [
          "plugins"
          new
        ]
    ) renamed);
}
