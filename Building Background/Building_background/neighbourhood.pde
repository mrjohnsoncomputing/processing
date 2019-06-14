class Neighbourhood {
  ArrayList<Building> buildings = new ArrayList();
  float road_edge = (height/6)*5;
  Building endBuilding;
  Building offscreen_building = new Building(-100,-100,0,0,0);
  Neighbourhood() {
    SkyScraper SS = new SkyScraper(this.road_edge);
    endBuilding = SS;
    this.buildings.add(SS);
  }
  
  void addBuilding(Building building) {
    if (building.position.x < width-building.size.x) {
      Building newBuilding = new SkyScraper(this.road_edge);
      this.buildings.add(newBuilding);
    } 
  }
  
  void removeBuilding() {
     if (this.offscreen_building.size.x > 0) {
        this.buildings.remove(this.offscreen_building);
        this.offscreen_building = new Building(-100,-100,0,0,0);
    }
  }
  
  void displayBuildings() {
    for (Building building : this.buildings) {
      building.display();
      Boolean onscreen = building.update();
      if(onscreen) {
        this.endBuilding = building;
      } else {
        this.offscreen_building = building;
      }
    }
    this.removeBuilding();
    addBuilding(this.endBuilding);
  }
}
