#!/usr/bin/env zsh

# Function to check if wf-recorder is running
is_wf_recorder_running() {
    pgrep -x wf-recorder > /dev/null
}

# Function to start wf-recorder
start_wf_recorder() {
    echo "Starting wf-recorder..."
    wf-recorder -f ~/Videos/recording_$(date +"%Y%m%d_%H%M%S").mp4 -g "$(slurp)" &!
    echo "Recording started."
}

# Function to stop wf-recorder
stop_wf_recorder() {
    echo "Stopping wf-recorder..."
    pkill -x wf-recorder
    echo "Recording stopped."
}

# Main logic
if is_wf_recorder_running; then
    stop_wf_recorder
else
    start_wf_recorder
fi
