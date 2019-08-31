export default class MarkerManager {
  constructor(map) {
    this.map = map;
    this.markers = {};
    this.createMarkerFromBench = this.createMarkerFromBench.bind(this);
  }
  // To add the marker to the map, call setMap();


  createMarkerFromBench(bench){
    const postion = new google.maps.LatLng(bench.lat, bench.lng);
    const newMarker = new google.maps.Marker({
      position : postion,
      map: this.map,
      benchId: bench.id
    });
    this.markers[newMarker.benchId] = newMarker;
    newMarker.setMap(this.map);

  }

  removeMarker(marker) {
    this.markers[marker.benchId].setMap(null);
    delete this.markers[marker.benchId];
  }
    
  updateMarkers(benches){
    const allBenches = {}
    
    benches.forEach(bench => {
      allBenches[bench.id] = bench;
    })

    benches.forEach(bench => {
      if (!this.markers[bench.id]) {
        this.createMarkerFromBench(bench);
      }
    })

    Object.keys(this.markers).forEach(benchId => {
      if (!allBenches[benchId]) {
        this.removeMarker(this.markers[benchId]) 
      }
    })
  }
}
