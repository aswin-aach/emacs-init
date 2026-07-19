# Emacs Init Files

Personal Emacs configuration. Entry point is `init.el`; feature modules live under `lisp/`.

Only `README.md`, `init.el`, `.gitignore`, and `lisp/` are tracked/synced with this repo — everything else in `~/.emacs.d` (caches, state files, `elpa/`, local experiments like `lisp/emacs-speech-input/`) stays local.

## Layout

`init.el`:
- Adds `lisp/` to `load-path`.
- Sets up `package.el` with MELPA and NonGNU ELPA archives.
- Registers `.epub` → `nov-mode`.
- Loads `use-package`, `request`.
- `exec-path-from-shell` syncs `$PATH`/env from the login shell.
- `company-mode` on all `prog-mode` buffers.
- Theme: `leuven`. `global-display-line-numbers-mode` on.
- `custom-set-variables`/`custom-set-faces` — Customize-managed; includes `package-selected-packages` (the full package list) and `package-vc-selected-packages` (two packages installed straight from git: `claude-code.el`, `ai-code-interface.el`, both from tninja's GitHub).
- Requires each `lisp/` module (order matters — `clojure-setup` loads before the custom-vars block; the rest after).

`lisp/` modules, one concern each:

- **`basic-convenience.el`** — UI/editing basics: menu/tool/scroll bars off, `column-number-mode`, no startup screen, `electric-pair-mode`, `tab-width` 4, `show-paren-mode`, `winner-mode` (window-layout undo/redo: `C-c <left>` / `C-c <right>`).

- **`ide-like-setup.el`** — LSP-adjacent IDE tooling:
  - `kotlin-mode`
  - `magit` (`C-x g` → `magit-status`), `magit-display-buffer-function` set to same-window-except-diff
  - `diff-hl` on `prog-mode` buffers, refreshed after magit ops
  - `treemacs` (`C-x t t`), follow-mode on
  - `dumb-jump` for Scala (xref backend, uses `rg`)
  - `consult` (`C-S-f` → `consult-ripgrep`, `C-c f` → `consult-find`)
  - `vertico` + `orderless` + `marginalia` for minibuffer completion

- **`dap-tidying.el`** — `dap-mode`/`dap-ui-mode` hooked into `lsp-mode`; `recentf-mode` (50 items); redirects backups, URL history, auto-save files, and Projectile's known-projects file into `~/.emacs.d/cache/` to keep the top-level directory clean.

- **`clojure-setup.el`** — `flycheck-clj-kondo`; CIDER nREPL logging on, REPL help banner off; `rainbow-delimiters`, `clj-refactor`, `flycheck` on `clojure-mode`.

- **`dired-open-right.el`** — rebinds `o` in Dired to open the file at point in the window to the right (splitting one if needed), instead of replacing the Dired buffer.

- **`activities-setup.el`** — workspace/session management via `activities.el` + `burly` (replaces `perspective.el`). Buffer restoration is bookmark.el-based, so Treemacs/Magit buffers restore natively without custom glue. Prompts to resume an activity on startup — on-demand restore of just the chosen activity, not eager replay of every saved one (that eager replay was the old startup delay).
  - `C-c p n` → new activity
  - `C-c p r` → resume an activity
  - `C-c p s` → suspend (save + close) current activity
  - `C-c p l` → list activities

## Install

Clone as `~/.emacs.d`:

```sh
git clone https://github.com/aswin-aach/emacs-init ~/.emacs.d
```

First launch installs everything in `package-selected-packages` plus the two `package-vc-selected-packages` git-sourced packages.

## Notes

- Cache/state files (backups, auto-saves, `recentf`, Projectile bookmarks, URL history) are redirected to `~/.emacs.d/cache/` — see `dap-tidying.el`.
- Edit `custom-set-variables`/`custom-set-faces` via `M-x customize` where possible rather than by hand, to avoid Customize clobbering manual edits.
