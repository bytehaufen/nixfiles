{
  global = {
    frame_color = "#d5c4a1";
    separator_color = "#d5c4a1";
    follow = "keyboard";

    width = 400;
    origin = "top-right";
    offset = "20x73";
    padding = 20;
    horizontal_padding = 20;
    frame_width = 3;
    sort = false;
    indicate_hidden = false;
    shrink = false;
    gap_size = 4;
    font = "Fira Code 12";
    line_height = 1;
    markup = "full";
    format = "<b>%s</b>\n%b";
    alignment = "left";
    corner_radius = 10;
    word_wrap = true;
    stack_duplicates = false;
    show_indicators = true;
    icon_position = "left";
    icon_theme = "breeze-dark";
    enable_recursive_icon_lookup = true;
    max_icon_size = 48;
    sticky_history = true;
    history_length = 20;
    mouse_left_click = "do_action, close_current";
    mouse_right_click = "open_url, close_current";
    always_run_script = true;
  };

  base16_low = {
    msg_urgency = "low";
    timeout = 4;
    background = "#282828";
    foreground = "#EBDBB2";
    frame_color = "#B3925F";
  };

  base16_normal = {
    msg_urgency = "normal";
    timeout = 8;
    background = "#282828";
    foreground = "#EBDBB2";
    frame_color = "#B3925F";
  };

  base16_critical = {
    msg_urgency = "critical";
    timeout = 0;
    background = "#1D2021";
    foreground = "#fb4934";
    frame_color = "#fb4934";
  };
}
