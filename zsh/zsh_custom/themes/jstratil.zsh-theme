ret_status="%(?:%{$fg_bold[green]%} ➜ :%{$fg_bold[red]%} ➜ )%{$reset_color%}"

local name='%{$fg_bold[green]%}%n%:'
local clock='%{$fg_bold[white]%}[%D{%H:%M:%S}]%{$reset_color%}'
local venv_prompt='$(virtualenv_prompt_info)'%{$reset_color%}
local hostname='%{$fg_bold[blue]%}%{$FG[003]%}(${$(hostname)%%"."*})%{$reset_color%}'
local cwd='%{$FG[075]%}[%~]%{$reset_color%}'
local git_branch='%{$fg_bold[red]%}$(git_branch)%{$reset_color%}'
local conda_venv='%{$FG[226]%}(${CONDA_DEFAULT_ENV}) %{$reset_color%}'

PROMPT="╭──${conda_venv}${hostname} ${venv_prompt} ${cwd}
╰──${clock} ${git_branch} ${name}
${ret_status} "


ZSH_THEME_VIRTUALENV_PREFIX="%{$fg_bold[yellow]%}["
ZSH_THEME_VIRTUALENV_SUFFIX="] %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[red]%}%{$FG[075]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[075]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[075]%})"