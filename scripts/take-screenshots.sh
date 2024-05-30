#!/usr/bin/env bash

## rofi-screenshot
## Author: ceuk @ github
## Licence: WTFPL
## Usage:
##    show the menu with rofi-screenshot
##    stop recording with rofi-screenshot -s

# Screenshot directory
screenshot_directory="$HOME/Pictures/Screenshots"

# Default date format
default_date_format="+%d-%m-%Y %H:%M:%S"

# set ffmpeg defaults
ffmpeg() {
  command ffmpeg -hide_banner -loglevel error -nostdin "$@"
}

video_to_gif() {
  ffmpeg -i "$1" -vf palettegen -f image2 -c:v png - |
    ffmpeg -i "$1" -i - -filter_complex paletteuse "$2"
}

crtc() {
  # notify-send --app-name="screenshot" "Screenshot" "Select a region to capture"
  ffcast -q "$(slop -n -f '-g %g ')" png /tmp/screenshot_clip.png
  xclip -selection clipboard -t image/png /tmp/screenshot_clip.png
  rm /tmp/screenshot_clip.png
  notify-send --app-name="screenshot" "Screenshot" "Region copied to Clipboard"
}

crtf() {
  # notify-send --app-name="screenshot" "Screenshot" "Select a region to capture"
  dt=$1
  ffcast -q "$(slop -n -f '-g %g ')" png "$screenshot_directory/$dt.png"
  notify-send --app-name="screenshot" "Screenshot" "Region saved to ${screenshot_directory//${HOME}/~}"
}

cstc() {
  ffcast -q png /tmp/screenshot_clip.png
  xclip -selection clipboard -t image/png /tmp/screenshot_clip.png
  rm /tmp/screenshot_clip.png
  notify-send --app-name="screenshot" "Screenshot" "Screenshot copied to Clipboard"
}

cstf() {
  dt=$1
  ffcast -q png "$screenshot_directory/$dt.png"
  notify-send --app-name="screenshot" "Screenshot" "Saved to ${screenshot_directory//${HOME}/~}"
}

rgrtf() {
  # notify-send --app-name="screenshot" "Screenshot" "Select a region to record"
  dt=$1
  ffcast -q "$(slop -n -f '-g %g ')" rec /tmp/screenshot_gif.mp4
  notify-send --app-name="screenshot" "Screenshot" "Converting to gif… (can take a while)"
  video_to_gif /tmp/screenshot_gif.mp4 "$screenshot_directory/$dt.gif"
  rm /tmp/screenshot_gif.mp4
  notify-send --app-name="screenshot" "Screenshot" "Saved to ${screenshot_directory//${HOME}/~}"
}

rgstf() {
  dt=$1
  ffcast -q rec /tmp/screenshot_gif.mp4
  notify-send --app-name="screenshot" "Screenshot" "Converting to gif… (can take a while)"
  video_to_gif /tmp/screenshot_gif.mp4 "$screenshot_directory/$dt.gif"
  rm /tmp/screenshot_gif.mp4
  notify-send --app-name="screenshot" "Screenshot" "Saved to ${screenshot_directory//${HOME}/~}"
}

rvrtf() {
  # notify-send --app-name="screenshot" "Screenshot" "Select a region to record"
  dt=$1
  ffcast -q "$(slop -n -f '-g %g ')" rec "$screenshot_directory/$dt.mp4"
  notify-send --app-name="screenshot" "Screenshot" "Saved to ${screenshot_directory//${HOME}/~}"
}

rvstf() {
  dt=$1
  ffcast -q rec "$screenshot_directory/$dt.mp4"
  notify-send --app-name="screenshot" "Screenshot" "Saved to ${screenshot_directory//${HOME}/~}"
}

stop_recording() {
  killall ffmpeg
  notify-send --app-name="screenshot" "Screenshot" "stoped recording"
}

get_options() {
  echo " Region  Clip"
  echo " Region  File"
  echo " Screen  Clip"
  echo " Screen  File"
  echo " Region  File (GIF)"
  echo " Screen  File (GIF)"
  echo " Region  File (MP4)"
  echo " Screen  File (MP4)"
  echo " stop recording"
}

check_deps() {
  if ! hash "$1" 2> /dev/null; then
    echo "Error: This script requires $1"
    exit 1
  fi
}

show_help() {
  echo ### rofi-screenshot
  echo "USAGE: rofi-screenshot [OPTION] <argument>"
  echo "(no option)"
  echo "    show the screenshot menu"
  echo "-s, --stop"
  echo "    stop recording"
  echo "-h, --help"
  echo "    this screen"
  echo "-d, --directory <directory>"
  echo "    set the screenshot directory"
  echo "-t, --timestamp <format>"
  echo "    set the format used for timestamps, in the format the date"
  echo "    command expects (default '+%d-%m-%Y %H:%M:%S')"
}

check_directory() {
  if [[ ! -d $1 ]]; then
    echo "Directory does not exist!"
    exit 1
  fi
}

main() {
  # check dependencies
  check_deps slop
  check_deps ffcast
  check_deps ffmpeg
  check_deps xclip
  check_deps rofi

  # rebind long args as short ones
  for arg in "$@"; do
    shift
    case "$arg" in
      '--help') set -- "$@" '-h' ;;
      '--directory') set -- "$@" '-d' ;;
      '--timestamp') set -- "$@" '-t' ;;
      '--stop') set -- "$@" '-s' ;;
      *) set -- "$@" "$arg" ;;
    esac
  done

  # parse short options
  OPTIND=1
  date_format="$default_date_format"
  while getopts "hd:t:" opt; do
    case "$opt" in
      'h')
        show_help
        exit 0
        ;;
      'd')
        check_directory $OPTARG
        screenshot_directory="$OPTARG"
        ;;
      't')
        date_format="$OPTARG"
        ;;
      's')
        stop_recording
        exit 0
        ;;
      '?')
        show_help
        exit 1
        ;;
    esac
  done
  shift $(expr $OPTIND - 1)

  # Get choice from rofi
  choice=$( (get_options) | rofi -dmenu -i -fuzzy -p "Screenshot")

  # If user has not picked anything, exit
  if [[ -z "${choice// /}" ]]; then
    exit 1
  fi

  cmd='date "${date_format}"'
  dt=$(eval $cmd)

  # run the selected command
  case $choice in
    ' Region  Clip')
      crtc
      ;;
    ' Region  File')
      crtf "$dt"
      ;;
    ' Screen  Clip')
      cstc
      ;;
    ' Screen  File')
      cstf "$dt"
      ;;
    ' Region  File (GIF)')
      rgrtf "$dt"
      ;;
    ' Screen  File (GIF)')
      rgstf "$dt"
      ;;
    ' Region  File (MP4)')
      rvrtf "$dt"
      ;;
    ' Screen  File (MP4)')
      rvstf "$dt"
      ;;
    ' stop recording')
      stop_recording
      exit 0
      ;;
  esac

  # done
  set -e
}

main "$@" &

exit 0

! /bin/bash
