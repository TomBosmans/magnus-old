class @Map
  constructor: ($map) ->
    @wrapper = $map
    @canvas = @wrapper.find('#map_canvas')
    @id = @wrapper.data('map-id')

    @zoom = @wrapper.data('zoom') || 2
    @center =
      lat: @wrapper.data('lat') || 50.5039
      lng: @wrapper.data('lng') || 4.4699
    @type = @wrapper.data('map') || 'show'
    
    @map = new (google.maps.Map)(@canvas[0],
      zoom: @zoom
      center: @center
      disableDoubleClickZoom: true)
    
    @initMarkers()
    @initListeners()  

  initMarkers: ->
    @markers = []

    for element in @wrapper.find('[data-marker]')
      position =
        lat: $(element).data('lat')
        lng: $(element).data('lng')
      marker = @newMarker(position)
      marker.db_id = $(element).data('marker')
      @markers.push marker

  newMarker: (position) ->
    marker = new (google.maps.Marker)(
      position: position
      map: @map
      draggable: @type != 'show')

    @markers.push marker
    @initListeners()
    marker 

  createMarker: (marker) ->
    data = { address: { map_id: @id, latitude: marker.position.lat(), longitude: marker.position.lng() } }
    $.ajax "/admin/addresses",
      type: 'POST'
      data: data
      success: (result) =>
        alert(result.id)
        marker.db_id = result.id

  editMarker: (marker, position) ->
    index = $.inArray(marker, @markers)
    return unless index >= 0
    @markers[index].setPosition(position)
    @initListeners()
    @markers[index]   

  updateMarker: (marker) ->
    data = { address: { latitude: marker.position.lat(), longitude: marker.position.lng() } }
    $.ajax "/admin/addresses/#{marker.db_id}",
      type: 'PATCH'
      data: data

  destroyMarker: (marker) ->
    index = $.inArray(marker, @markers)
    return unless index >= 0
    @markers[index].setMap(null)
    @markers.splice index, 1
    @initListeners()
    $.ajax "/admin/addresses/#{marker.db_id}",
      type: 'DELETE'

  initListeners: ->
    switch @type
      when "edit" then @initEditListeners()
      when "edit-sa" then @initEditSAListeners()
      when "show" then @initShowListeners()

  initEditListeners: ->
    unless @map.listeners
      @map.listeners = true
      # Create new marker
      @map.addListener 'click', (event) =>
        marker = @newMarker(event.latLng)
        @createMarker(marker)

    for marker in @markers
      unless marker.listeners
        marker.listeners = true
        # Update marker
        marker.addListener 'dragend',  =>
          edited_marker = @editMarker(marker, marker.getPosition())
          @updateMarker(edited_marker)

        # Destroy marker
        marker.addListener 'dblclick', =>
          @destroyMarker(marker)

  # When only single address is allowed
  initEditSAListeners: ->
    unless @map.listeners
      @map.listeners = true
      @map.addListener 'click', (event) =>
        # When there is no marker we create one, else we update the marker
        if @markers.length > 0
          marker = @editMarker(@markers[0], event.latLng)
          @updateMarker(marker)
        else
          marker = @newMarker(event.latLng)
          @createMarker(marker)

    for marker in @markers
      unless marker.listeners
        marker.listeners = true
        # Update marker
        marker.addListener 'dragend',  =>
          edited_marker = @editMarker(marker, marker.getPosition())
          @updateMarker(edited_marker)

        # Destroy marker
        marker.addListener 'dblclick', =>
          @destroyMarker(marker)

  initShowListeners: ->
    # Show info etc?

$ ->
  for map in $('[data-map]')
    new Map($(map))