# Tip of the day in zsh

### Usage:
```sh
git clone https://github.com/ahmubashshir/zsh-tip-of-the-day
source ./zsh-tip-of-the-day/tip-of-the-day.plugin.zsh onload
tip-of-the-day
```

### Configuration:
```bash
# tips allowlist
zsh_load_tips=(shell systemd)
# tips denylist
zsh_load_tips=(all -systemd)

# reload to apply changes in current session
tip-of-the-day --reload
```
