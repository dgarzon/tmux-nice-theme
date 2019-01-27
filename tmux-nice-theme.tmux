#!/usr/bin/env bash

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

#
# Colors
#
theme_black=$(get "@theme_black", "colour0")
theme_red=$(get "@theme_red", "colour1")
theme_green=$(get "@theme_green", "colour2")
theme_yellow=$(get "@theme_yellow", "colour3")
theme_blue=$(get "@theme_blue", "colour4")
theme_white=$(get "@theme_white", "colour7")
theme_grey=$(get "@theme_grey", "colour8")

#
# Widgets
#
status_widgets=$(get "@theme_widgets")

#
# Formats
#
time_format=$(get "@theme_time_format" "%R")
date_format=$(get "@theme_date_format" "%d/%m/%Y")

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$theme_white"
set "message-bg" "$theme_black"

set "message-command-fg" "$theme_white"
set "message-command-bg" "$theme_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$theme_black"
setw "window-status-bg" "$theme_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$theme_black"
setw "window-status-activity-fg" "$theme_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$theme_grey"
set "window-active-style" "fg=$theme_white"

set "pane-border-fg" "$theme_grey"
set "pane-border-bg" "$theme_black"
set "pane-active-border-fg" "$theme_green"
set "pane-active-border-bg" "$theme_black"

set "display-panes-active-colour" "$theme_yellow"
set "display-panes-colour" "$theme_blue"

set "status-bg" "$theme_black"
set "status-fg" "$theme_white"

set "@prefix_highlight_fg" "$theme_black"
set "@prefix_highlight_bg" "$theme_green"
set "@prefix_highlight_copy_mode_attr" "fg=$theme_black,bg=$theme_green"
set "@prefix_highlight_output_prefix" "  "

set "status-right" "#[fg=$theme_white,bg=$theme_black,nounderscore,noitalics]${time_format}  ${date_format} #[fg=$theme_grey,bg=$theme_black]#[fg=$theme_grey,bg=$theme_grey]#[fg=$theme_white, bg=$theme_grey]${status_widgets} #[fg=$theme_green,bg=$theme_grey,nobold,nounderscore,noitalics]#[fg=$theme_black,bg=$theme_green,bold] #H #[fg=$theme_yellow, bg=$theme_green]#[fg=$theme_yellow,bg=$theme_yellow]#[fg=$theme_red, bg=$theme_yellow]#[fg=$theme_red,bg=$theme_red] #[]"
set "status-left" "#[fg=$theme_grey,bg=$theme_green,bold] #S #{prefix_highlight}#[fg=$theme_green,bg=$theme_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$theme_black,bg=$theme_black,nobold,nounderscore,noitalics]#[fg=$theme_white,bg=$theme_black] #I  #W #[fg=$theme_black,bg=$theme_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$theme_black,bg=$theme_grey,nobold,nounderscore,noitalics]#[fg=$theme_white,bg=$theme_grey,nobold] #I  #W #[fg=$theme_grey,bg=$theme_black,nobold,nounderscore,noitalics]"
