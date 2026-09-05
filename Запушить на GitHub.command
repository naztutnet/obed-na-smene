#!/bin/bash
cd "$(dirname "$0")"
echo "== Обед на смене → GitHub =="
rm -rf _to_delete "Claude outputs"
if [ ! -d .git ]; then
  git init -b main
  git add .
  git commit -m "Прототип «Обед на смене»"
fi
if command -v gh >/dev/null 2>&1; then
  gh auth status >/dev/null 2>&1 || gh auth login
  gh repo create obed-na-smene --public --source=. --push && \
  echo "" && echo "Готово: https://github.com/$(gh api user -q .login)/obed-na-smene"
else
  echo ""
  echo "gh не установлен. Два варианта:"
  echo "  1) brew install gh   — и запусти этот файл ещё раз"
  echo "  2) создай пустой репозиторий obed-na-smene на github.com и выполни:"
  echo "     git remote add origin git@github.com:naztutnet/obed-na-smene.git"
  echo "     git push -u origin main"
fi
echo ""
read -n 1 -s -r -p "Нажми любую клавишу, чтобы закрыть"
