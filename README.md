# sktech_p2dbatching
Testing 2D Pixel batching in Procesing

How to use:
* Left click to create pixels
* Right click to delete pixels
* Each time the grid is updated, `batch()` is called

Programming `batch()`
* The task is to calculate the shapes the individual pixels in the grid form.
* A pixel is of type `boolean`
* A shape is of type `long[]`
* A `long` in a shape represents a coordinate. Build it with `coord(x, y)`.
* The variable `w` tells the columns of the grid.
* The variable `h` tells the rows of the grid.
* A pixel can be accessed using `grid[x][y]`.
