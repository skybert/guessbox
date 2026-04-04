# Guessbox

Container to run your favourite guessing machine, aka AI agent, in.

Mitigates several of the security concerns of running an AI agent on
your machine, albeit far from all.

100% coded by a human.

# Usage

```perl
$ make
```

## Configuration options

Unix environment variables supported:
- `GUESS_CONTAINER_CMD`, default is `podman`.
- `GUESS_DATA_DIR`, defualt is `~/.guessbox`
- `GUESS_SRC_DIR`, for specifying the base directory of your source
  code checkouts. Default is `~/src`.
