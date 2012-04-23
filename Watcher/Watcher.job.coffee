job: Watcher:
  
  goal: "Watch things for changes"

  services:
    watch: "Given a target, watch a location (recursively) for events":
      in:
        target: "a target to watch"
        location: "location within target"
        recursive: "watch location recursively?"
        eventsMap: "a map of events to filters"
      
      sideFX: "implement a specific watching strategy"


  example:

    StreamWatcher:
      isA: 'Watcher'
      goal: "watch a stream"
      services:
        watch:
          in: 
            target: @stream
            location: @streamAddress
            recursive: false
            eventsMap: @object

          sideFX: ->
            while (1)
              #poll target