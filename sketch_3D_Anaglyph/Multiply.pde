void multiply(PImage img1, String col) {
  float r2 = 0;
  float g2 = 255;
  float b2 = 255;
  if (col == "RED") {
    r2 = 255;
    g2 = 0;
    b2 = 0;
  }
  // Since we are going to access the image's pixels too  
  img1.loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < 640; x++) {
      int loc = x + y*640;
      
      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r1 = red(img1.pixels[loc]);
      float g1 = green(img1.pixels[loc]);
      float b1 = blue(img1.pixels[loc]);
      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, 
      // before setting the pixel in the display window.
      float r = multiplyPixel(r1, r2);
      float g = multiplyPixel(g1, g2);
      float b = multiplyPixel(b1, b2);
      
      
      // Set the display pixel to the image pixel
      img1.pixels[loc] =  color(r,g,b);          
    }
  }
  img1.updatePixels();
}

float multiplyPixel(float p1, float p2) {
  return (p1 * p2) / 255;
}
