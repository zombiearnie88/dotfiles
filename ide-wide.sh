#!/bin/bash
tmux split-window -v -p 25
tmux split-window -h -p 65
tmux split-window -h
tmux select-pane -U
tmux split-window -h -p 75
