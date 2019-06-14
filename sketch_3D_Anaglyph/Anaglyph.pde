class Anaglyph {
  PImage Rimg;
  PImage Limg;
  PImage Rmask;
  PImage Lmask;
  PImage rightImage;
  PImage leftImage;
  PImage image;
  int Xshift;
  int Yshift;
  Anaglyph(PImage Rimg, PImage Limg, int Xshift, int Yshift) {
    this.Rimg = Rimg;
    this.Limg = Limg;
    this.Rmask = this.getFillImage("RED");
    this.Lmask = this.getFillImage("CYAN");
    this.Xshift = Xshift;
    this.Yshift = Yshift;
  }
  
  void create() {
    this.rightImage = this.multiply(this.Rimg, this.Rmask);
    this.shiftPixels(this.rightImage, 'X');
    this.shiftPixels(this.rightImage, 'Y');
    this.leftImage = this.multiply(this.Limg, this.Lmask);
    this.image = this.screen();
  }
  
  PImage multiply(PImage img, PImage mask) {
    PImage newImg = createImage(width, height,RGB);
    // Since we are going to access the image's pixels too  
    img.loadPixels();
    mask.loadPixels();
    newImg.loadPixels();
    
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int loc = x + y*width;
        // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
        float r1 = red(img.pixels[loc]);
        float g1 = green(img.pixels[loc]);
        float b1 = blue(img.pixels[loc]);
        
        float r2 = red(mask.pixels[loc]);
        float g2 = green(mask.pixels[loc]);
        float b2 = blue(mask.pixels[loc]);
        // Image Processing would go here
        // If we were to change the RGB values, we would do it here, 
        // before setting the pixel in the display window.
        float r = this.multiplyPixel(r1, r2);
        float g = this.multiplyPixel(g1, g2);
        float b = this.multiplyPixel(b1, b2);
        
        // Set the display pixel to the image pixel
        newImg.pixels[loc] =  color(r,g,b);          
      }
    }
    newImg.updatePixels();
    mask.updatePixels();
    img.updatePixels();
    return newImg;
  }
  
  PImage screen() {
    PImage newImg = createImage(width, height,RGB);
    // Since we are going to access the image's pixels too  
    this.rightImage.loadPixels();
    this.leftImage.loadPixels();
    newImg.loadPixels();
    
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int loc = x + y*width;
        // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
        float r1 = red(this.rightImage.pixels[loc]);
        float g1 = green(this.rightImage.pixels[loc]);
        float b1 = blue(this.rightImage.pixels[loc]);
        
        float r2 = red(this.leftImage.pixels[loc]);
        float g2 = green(this.leftImage.pixels[loc]);
        float b2 = blue(this.leftImage.pixels[loc]);
        // Image Processing would go here
        // If we were to change the RGB values, we would do it here, 
        // before setting the pixel in the display window.
        float r = this.screen(r1, r2);
        float g = this.screen(g1, g2);
        float b = this.screen(b1, b2);
        
        // Set the display pixel to the image pixel
        newImg.pixels[loc] =  color(r,g,b);          
      }
    }
    newImg.updatePixels();
    this.rightImage.updatePixels();
    this.leftImage.updatePixels();
    return newImg;
  }
  
  float screen(float p1, float p2) {
    return 255 - (((255-p1)*(255-p2))/255);
  }
  
  float multiplyPixel(float p1, float p2) {
    return (p1 * p2) / 255;
  }
  
  void shiftPixels(PImage img, char dir) {
    int shift;
    int Xmod = 0; 
    int Ymod = 0;
    if (dir=='X') {
      shift = this.Xshift;
      Xmod = 1;
    } else {
      shift = this.Yshift;
      Ymod = 1;
    }
    for (int i = 0; i < shift ; i ++) {
      img.loadPixels();
      for (int y = height-2; y >= 0; y--) {
        for (int x = width-2; x >= 0; x--) {
          int current_loc = x + y*width;
          int new_loc  = (x +Xmod)+ (y+Ymod)*width; 
          // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
          float r = red(img.pixels[current_loc]);
          float g = green(img.pixels[current_loc]);
          float b = blue(img.pixels[current_loc]);
          
          // Set the display pixel to the image pixel
          img.pixels[new_loc] =  color(r,g,b);          
        }
      }
      img.updatePixels();
    }
  }
  
  PImage getFillImage(String col) {
    PImage img = createImage(width, height,RGB);
    color colour;
    if (col == "CYAN") {
      colour = color(0, 255, 255);
    } else if (col == "RED") {
      colour = color(255,0,0);
    } else {
      colour = color(0,0,0);
    }
    for (int i = 0; i < img.pixels.length; i++) {
      updatePixel(img, i, colour);
    }
    return img;
  }
  
  PImage updatePixel(PImage img, int i, color colour) {
    img.loadPixels();
    img.pixels[i] = colour; 
    img.updatePixels();
    return img;
  }
  
  void display() {
    image(this.image, 0, 0);
  }
    
}
