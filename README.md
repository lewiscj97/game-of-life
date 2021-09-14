# Conway's Game of Life

Conway's Game of Life is a programming problem - https://github.com/makersacademy/course/blob/main/individual_challenges/game_of_life.md.

## Rules

- The game evolves in turns, commonly known as 'ticks'.
- All changes occur at the same time.
- Any live cell with 2 or 3 live neighbours survives until next tick.
- Any live cell with less than 2 live neighbours dies (underpopulation).
- Any live cell with more than 3 live neighbours dies (overpopulation).
- Any dead cell with exactly 3 neighbours becomes a live cell (reproduction).

## How to use

```bash
ruby lib/game.rb
```

This command launches the game with its default settings (20 x 20 grid).

```bash
ruby lib/game.rb x y
```

Passing `x` and `y` on the command line at start-up will set the grid size (i.e. `x` x `y`).

e.g.

```bash
ruby lib/game.rb 40 50
# Gives a grid of 40x50
```