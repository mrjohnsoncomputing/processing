Neighbourhood neighbourhood;

void setup() {
  size(800, 600); 
  neighbourhood = new Neighbourhood();
}

void draw() {
   background(50);
   //Add a road
   fill(0);
   rect(0, neighbourhood.road_edge, width, height);
   //Generate buildings
   neighbourhood.displayBuildings();
}
