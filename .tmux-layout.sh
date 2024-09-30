
#tmux split-window -v -p 66
#tmux split-window -v
#tmux select-pane -t 1
#tmux split-window -h

# Create 3 vertical panes
#tmux select-pane -t 0
#tmux split-window -h
#tmux split-window -h
#tmux select-pane -t 0
#tmux resize-pane -x 33
#tmux select-pane -t 1
#tmux resize-pane -x 33
#tmux select-pane -t 0


#!/bin/bash

# Start with one full-screen pane

# Split the window vertically into top (2/3 height) and bottom (1/3 height)
tmux split-window -v

tmux resize-pane -t 0 -y 30

# Move to the top pane and split it into 3 vertical panes
tmux select-pane -t 0
tmux split-window -h  # First split
tmux split-window -h  # Second split, now there are 3 vertical panes

# Equalize the top 3 vertical panes
#tmux select-layout -t 0 even-horizontal  # Apply even-horizontal to the top 3 panes only

# Move to the bottom pane
tmux select-pane -t 3  # Select the bottom pane

# Split the bottom pane into 2 horizontal panes
tmux split-window -h  # This creates 2 equal horizontal panes

# Optional: Focus back on the first pane (top left)
tmux select-pane -t 0

