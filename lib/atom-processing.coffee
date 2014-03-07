exec = require("child_process").exec

module.exports =
  activate: ->
    atom.workspaceView.command "atom-processing:run", =>
      @runSketch()

  runSketch: ->
    editor = atom.workspace.getActiveEditor()
    file   = editor.getPath()
    arr    = file.split "/"
    path   = arr[0..arr.length-2].join "/"
    command = "processing-java --sketch=#{path} --output=#{path}/build --run --force"

    exec(command, (error, stdout, stderr) ->
        if error
          console.log error.stack
          console.log "Error code: #{error.code}"
          console.log "Signal: #{error.signal}"
        console.log "STDOUT: #{stdout}"
        console.log "STDERR: #{stderr}"

    )
