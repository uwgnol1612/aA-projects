import React from 'react';
import MarkerManager from '../util/marker_manager';


class BenchMap extends React.Component {

  constructor(props) {
    super(props)
    this.listenForMove = this.listenForMove.bind(this);
  }

  componentDidMount () {
      
    const mapOptions = { 
      center: { lat: 37.7758, lng: -122.435 },
      zoom: 13
    };
            
    this.map = new google.maps.Map(this.mapNode, mapOptions)
    this.markerManager = new MarkerManager(this.map);

    this.listenForMove();
    // debugger
    this.markerManager.updateMarkers(this.props.benches);
    
  
  }

  componentDidUpdate (oldProps) {

    if (oldProps.benches.length !== this.props.benches.length){
      debugger
      this.markerManager.updateMarkers(this.props.benches);
    }

  }

  render() {
    return (
      <div id="map-container" ref={ map => this.mapNode = map }>
      </div>
    )
  }
  
  listenForMove() {
      
    const bounds  = {};
    /* 
     * we listen for the map to emit an 'idle' event, it does this when
     * the map stops moving
     */

    google.maps.event.addListener(this.map, 'idle', () => {
      const LatLngBounds = this.map.getBounds(); 
          
      bounds['northEast'] = {}
      bounds['northEast']['lat'] = LatLngBounds.getNorthEast().lat();
      bounds['northEast']['lng'] = LatLngBounds.getNorthEast().lng();
  
      bounds['southWest'] = {}
      bounds['southWest']['lat'] = LatLngBounds.getSouthWest().lat();
      bounds['southWest']['lng'] = LatLngBounds.getSouthWest().lng();
    });
  
    this.props.updateFilter(bounds);
  }


} 


export default BenchMap;