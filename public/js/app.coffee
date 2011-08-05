
class WSCli
  constructor: () ->
    @socket = io.connect()
    @socket.on 'connect', () -> console.log('ws:connect ok')

    @socket.on 'vr_start_talker_resp', (data) =>
      console.log("vr_start_talker_resp: "+data.txt)
      @appendLines(data)
    @socket.on 'vr_stop_talker_resp', (data) =>
      console.log "vr_stop_talker_resp: "+data.txt  
      @appendLines(data)

    @socket.on 'vr_start_listener_resp', (data) =>
      console.log("vr_start_listener_resp: "+data.txt)
      @appendLines(data)
    @socket.on 'vr_stop_listener_resp', (data) =>
      console.log "vr_stop_listener_resp: "+data.txt  
      @appendLines(data)


    @socket.on 'tail_start_resp', @appendLines
    @socket.on 'tail_watch_resp', @appendLines

    $('#tail_start').click () => @socket.emit('tail_start', {})
    $('#tail_stop').click () => @socket.emit('tail_stop', {})

    $('#vr_start_talker').click () =>
      @socket.emit('vr_start_talker', {talker: '14246530757', listener: '13108768635'})
    $('#vr_stop_talker').click () =>
      @socket.emit('vr_stop_talker', {talker: '14246530757', listener: '13108768635'})

    $('#vr_start_listener').click () =>
      @socket.emit('vr_start_listener', {talker: '14246530757', listener: '13108768635'})
    $('#vr_stop_listener').click () =>
      @socket.emit('vr_stop_listener', {talker: '14246530757', listener: '13108768635'})

  appendLines: (data) =>
    if data and !_.isEmpty(data)
      _.each data.lines, (l) =>
        $("#ws_console").append("<p>"+l+"</p>")

