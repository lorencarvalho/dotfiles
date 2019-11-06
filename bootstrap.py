#!/usr/bin/env python3

import logging
import shutil
import sys

from pathlib import Path

log_format = "%(asctime)s - %(name)s - %(message)s"
logging.basicConfig(stream=sys.stdout, level=logging.INFO, format=log_format)
log = logging.getLogger("bootstrap")

HERE = Path(__file__).absolute().parent
HOME = Path.home()
DISALLOW = set([".git", ".gitignore", ".gitmodules", ".mypy_cache"])
XDG = HOME / ".config"


def symlinker(src, dest) -> None:
    log.info("symlink %s", src)

    try:
        if src.is_symlink() or src.is_file():
            src.unlink()
        else:
            shutil.rmtree(src)
    except (FileNotFoundError, FileExistsError):
        log.info("fail to unlink %s (file may not have existed yet)", src)
    finally:
        src.symlink_to(dest)


def main():

    # do symlinks
    targets = set([(HOME / f.name, HERE / f.name) for f in HERE.iterdir() if f.name.startswith(".") and f.name not in DISALLOW])
    targets.add((XDG / "nvim", HERE / 'nvim'))

    for src, dest in targets:
        symlinker(src, dest)


if __name__ == "__main__":
    main()
