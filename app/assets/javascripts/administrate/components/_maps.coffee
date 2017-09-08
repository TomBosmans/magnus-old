class @Map
  constructor: ($map) ->
    @wrapper = $map
    @canvas = @wrapper.find('#map_canvas')

    @markers = []

    @zoom = @wrapper.data('zoom') || 2
    @center =
      lat: @wrapper.data('lat') || 50.5039
      lng: @wrapper.data('lng') || 4.4699
    @type = @wrapper.data('map') || 'show'
    
    @map = new (google.maps.Map)(@canvas[0],
      zoom: @zoom
      center: @center
      disableDoubleClickZoom: true)

    # google.maps.event.addListenerOnce @map, 'idle', =>
    #   @markers = @initMarkers()
    
    @initListeners()

  initMarkers: ->
    markers = []

    for element in @wrapper.find('[data-marker]')
      position =
        lat: $(element).data('lat')
        lng: $(element).data('lng')
      marker = @createMarker(position)
      markers.push marker
    markers

  createMarker: (position) ->
    marker = new (google.maps.Marker)(
      position: position
      map: @map
      draggable: true)

    @markers.push marker
    @initListeners()

  updateMarker: (marker, position) ->
    return unless $.inArray(marker, @markers)
    @markers[$.inArray(marker, @markers)].setPosition(position)
    @initListeners()

  destroyMarker: (marker) ->
    return unless $.inArray(marker, @markers)
    @markers.splice $.inArray(marker, @markers), 1
    marker.setMap(null)
    @initListeners()

  initListeners: ->
    switch @type
      when "edit" then @initEditListeners()
      # when "edit-one-marker" then initEditOneMarkerListeners()
      # when "show" then initShowListeners()

  initEditListeners: ->
    # Create new marker
    @map.addListener 'dblclick', (event) =>
      @createMarker(event.latLng)
      initUpdateMarkers()

    # Update marker
    for marker in @markers
      marker.addListener 'dragend',  ->
        @updateMarker(marker, marker.getPosition())


$ ->
  for map in $('[data-map]')
    new Map($(map))