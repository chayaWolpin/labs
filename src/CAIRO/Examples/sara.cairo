func rotate_image(mut self, clockwise: felt) -> (rotated_image: felt*):
    alloc_locals
    
    let (w, h) = (self.width, self.height)
    let size = w * h
    let (new_pixels) = alloc(size)
    let mut new_x
    let mut new_y
    let mut new_idx
    let mut current_idx
    
    
    for row in range(0, h):
    for col in range(0, w):
        new_x = if clockwise { h - 1 - row } else { row }
        new_y = if clockwise { col } else { w - 1 - col }
        new_idx = new_y * h + new_x  # גובה התמונה החדשה הוא הרוחב של התמונה המקורית
        current_idx = row * w + col
        new_pixels[new_idx * 4 + 0] = self.pixels[current_idx * 4 + 0]
        new_pixels[new_idx * 4 + 1] = self.pixels[current_idx * 4 + 1]
        new_pixels[new_idx * 4 + 2] = self.pixels[current_idx * 4 + 2]
        new_pixels[new_idx * 4 + 3] = self.pixels[current_idx * 4 + 3]

        self.pixels = new_pixels
        self.width = h
        self.height = w
        self.last_operation = Operation.Transform