use debug::PrintTrait;
use debug::PrintTrait; 
use array::ArrayTrait;
struct Operation {
    op_type: felt252, // 0: NoOp, 1: AdjustColor, 2: Transform, 3: Pixelate, 4: BilateralFilter, 5: Miniaturize, 6: GaussianBlur, 7: Cartoonify
    param1: felt252,
    param2: felt252,
    param3: felt252,
    param4: felt252,
}

struct Image {
    width: felt252,
    height: felt252,
    pixels: felt252[PIXELS_SIZE], // גודל קבוע לפיקסלים
    pixels_bk: felt252[PIXELS_SIZE], // גודל קבוע לפיקסלים גיבוי
    width_bk: felt252,
    height_bk: felt252,
    last_operation: Operation,
    hsi: felt252[HSI_SIZE][3], // גודל קבוע עבור HSI
    lab: felt252[LAB_SIZE], // גודל קבוע עבור LAB
}

// להגדיר את הגדלים המקסימליים
const PIXELS_SIZE: felt252 = 1024; // גודל מקסימלי לדוגמה
const HSI_SIZE: felt252 = 100; // גודל מקסימלי לדוגמה
const LAB_SIZE: felt252 = 300; // גודל מקסימלי לדוגמה

// Example usage:
fn main() {

}








fn rotate(mut self, clockwise: bool) { // rotate 90
    let (w, h) = (self.width as usize, self.height as usize);

        let mut new_pixels= ArrayTrait::<usize>::new();
        new_pixels.append(444);
        numbers.append(555);
    
    
 
    let array: [u8; N] = [0; N];



    let mut new_pixels = vec![0_u8; w * h * 4];
    let mut new_x;
    let mut new_y;
    let mut new_idx: usize;
    let mut current_idx: usize;

    for row in 0..h {
        for col in 0..w {
            new_x = if clockwise { h - 1 - row } else { row };
            new_y = if clockwise { col } else { w - 1 - col };
            new_idx = new_y * h + new_x; // new image's height is original image's width
            current_idx = row * w + col;

            new_pixels[new_idx * 4 + 0] = self.pixels[current_idx * 4 + 0];
            new_pixels[new_idx * 4 + 1] = self.pixels[current_idx * 4 + 1];
            new_pixels[new_idx * 4 + 2] = self.pixels[current_idx * 4 + 2];
            new_pixels[new_idx * 4 + 3] = self.pixels[current_idx * 4 + 3];
        }
    }
    self.pixels = new_pixels;
    self.width = h as u32;
    self.height = w as u32;
    self.last_operation = Operation::Transform
}









public class ImageRotator {

    /**
     * Rotates a given image 90 degrees clockwise.
     *
     * @param originalImage The original image represented as a 2D array of integers (pixel values).
     * @return A new 2D array of integers representing the rotated image.
     */
    public static int[][] rotateImage90DegreesClockwise(int[][] originalImage) {
        int width = originalImage.length;
        int height = originalImage[0].length;

        // Create a new array with swapped dimensions
        int[][] rotatedImage = new int[height][width];

        // Copy the pixels to the new array in rotated positions
        for (int i = 0; i < width; i++) {
            for (int j = 0; j < height; j++) {
                rotatedImage[j][width - 1 - i] = originalImage[i][j];
            }
        }

        return rotatedImage;
    }

    public static void main(String[] args) {
        // Example usage
        int[][] rawImage = {
            {1, 2, 3},
            {4, 5, 6},
            {7, 8, 9}
        };

        int[][] rotatedImage = rotateImage90DegreesClockwise(rawImage);

        // Print rotated image
        for (int i = 0; i < rotatedImage.length; i++) {
            for (int j = 0; j < rotatedImage[i].length; j++) {
                System.out.print(rotatedImage[i][j] + " ");
            }
            System.out.println();
        }
    }
}










fn rotate_image(originalImage: Array<Array<usize>>)->Array<Array<usize>>{
    let width = originalImage.len();
    let height = originalImage[0].len();

    let mut rotated_image= ArrayTrait::<ArrayTrait<usize>>::new();

}

