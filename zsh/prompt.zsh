
# Black: 0, 0, 0
# Red: 229, 34, 34
# Green: 166, 227, 45
# Yellow: 252, 149, 30
# Blue: 196, 141, 255
# Magenta: 250, 37, 115
# Cyan: 103, 217, 240
# White: 242, 242, 242

function virtualenv_prompt_info(){
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "[${VIRTUAL_ENV:t}]"
}

PROMPT='$(virtualenv_prompt_info)%{$fg[magenta]%}[%c]%{$reset_color%}$(git-radar --zsh --fetch) '

# More symbols to choose from:
# ☀ ✹  ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠ 
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ
