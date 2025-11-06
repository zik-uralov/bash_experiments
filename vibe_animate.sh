#!/usr/bin/env bash
# vibe_frame_bg_clear_inside.sh — full-screen emoji/kana/hangul background,
# empty interior under the frame, smooth V I B E + coding animation.

trap 'tput cnorm; tput sgr0; clear; exit' INT TERM
tput civis

# color sets
letter_colors=(1 7 3 4 2 3)
bg_colors=(1 2 3 4 5 6 7)

# animation frames
frames=(
"V I B E"
"V I B E"
"< I B E"
"V I B E"
"> I B E"
"V I B E"
"V Я B E"
"V I B E"
"V Я B E"
"V I ᗺ E"
"V I B E"
"V I ᗺ E"
"V I B E"
"V I ᗺ E"
"V I B ∃"
"V I B E"
"V I B ∃"
"V I B E"
"V I B ∃"
"V I B E"
"V I B ∃"
)

coding="c o d i n g"
interval=0.25
index=0

# geometry
clear
cols=$(tput cols)
rows=$(tput lines)

frame="${frames[0]}"
width_vibe=${#frame}
width_code=${#coding}
content_w=$(( width_vibe > width_code ? width_vibe : width_code ))

pad_x=4
pad_y=1
frame_w=$(( content_w + 2*pad_x + 2 ))
frame_h=$(( pad_y + 2 + pad_y + 2 ))
top=$(( (rows - frame_h) / 2 ))
left=$(( (cols - frame_w) / 2 ))
vibe_row=$(( top + pad_y + 1 ))
code_row=$(( vibe_row + 1 ))
vibe_col=$(( left + pad_x + 1 + (content_w - width_vibe)/2 ))
code_col=$(( left + pad_x + 1 + (content_w - width_code)/2 ))

# background character pool
bg_chars=(🔥 🌸 💫 🌊 💥 ✨ 🌀 🌟 🦋 💎 🧿 あ い う え お カ キ ク ケ コ サ シ ス セ ソ た ち つ て と 한 두 세 네 다 라 마 바 사 아 자 차 카 타 파 하)

# ─── fill entire screen once, but leave frame area blank ───
for ((r=0; r<rows; r++)); do
  line=""
  for ((c=0; c<cols; c++)); do
    inside=false
    # inside frame rectangle?
    if (( r >= top && r < top + frame_h && c >= left && c < left + frame_w )); then
      inside=true
    fi
    if $inside; then
      line+=" "          # blank space inside the frame
    else
      sym="${bg_chars[RANDOM % ${#bg_chars[@]}]}"
      color="${bg_colors[RANDOM % ${#bg_colors[@]}]}"
      line+="\033[3${color}m${sym}\033[0m"
    fi
  done
  tput cup "$r" 0
  printf "%b" "$line"
done
tput sgr0

# draw static dotted frame
for ((r=0; r<frame_h; r++)); do
  for ((c=0; c<frame_w; c++)); do
    (( r==0 || r==frame_h-1 || c==0 || c==frame_w-1 )) || continue
    tput cup $((top + r)) $((left + c))
    tput setaf $((1 + RANDOM % 7))
    printf "·"
  done
done
tput sgr0

# ─── animation loop ───
while :; do
  frame="${frames[$index]}"

  # V I B E
  tput cup $vibe_row $vibe_col
  tput el
  tput bold
  IFS='' read -r -a chars_v <<< "$(echo "$frame" | sed 's/./& /g')"
  for ch in "${chars_v[@]}"; do
    [[ "$ch" == " " ]] && { printf " "; continue; }
    tput setaf "${letter_colors[$((RANDOM % ${#letter_colors[@]}))]}"
    printf "%s" "$ch"
  done
  tput sgr0

  # coding
  tput cup $code_row $code_col
  tput el
  tput bold; tput setaf 6
  printf "%s" "$coding"
  tput sgr0

  sleep "$interval"
  (( index = (index + 1) % ${#frames[@]} ))
done
