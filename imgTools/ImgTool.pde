class ImgTool {
  ImgTool() {
  
  }
  
  PImage brighten(PImage raw_img, int x) {
    PImage img = raw_img;
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      float r = min(red(img.pixels[i]) + x, 255);
      float g = min(green(img.pixels[i]) + x, 255);
      float b = min(blue(img.pixels[i]) + x, 255);
      img.pixels[i] = color(r,g,b);   
    }
    img.updatePixels();
    return img;
  }
  
}
