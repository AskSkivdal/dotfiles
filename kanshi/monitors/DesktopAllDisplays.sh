#!/bin/bash

sleep 1
hyprctl dispatch '
function() 
    monitor_cfg = {
        ["DP-2"]=1, 
        ["HDMI-A-1"]=2, 
        ["DP-1"]=3
    }

    for monitor,workspace in pairs(monitor_cfg) do 
        hl.dispatch(hl.dsp.workspace.move({workspace=workspace, monitor=monitor})) 
    end 
end
'