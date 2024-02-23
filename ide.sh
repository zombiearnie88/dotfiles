#!/bin/bash
tmux split-window -v -p 25
tmux split-window -h -p 50
tmux select-pane -U
tmux split-window -h -p 75
