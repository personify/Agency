agent: LinuxWatcher: 

  isA: 'Watcher'

  goal: "watch files on linux using inotify"
 
  services:  
    watch: 
      in: 
        location: @path
        recursive: @bool
        eventMap: @object

      sideFX: ->
        
  
  spec:

    given: 'FileSystemWatcher is watching ./_specs/scratch': ->

      FileSystemWatcher.watch 
        target: 'linux'
        location: './_specs/scratch'
        recursive: false
        eventMap:
          save:
            '.+\.coffee' : (file) -> @then 'coffee filter cb is called'

    when: 'hello.coffee is created and saved' : ->
      sh 'echo "hi, world" > ./_specs/scratch/hello.coffee'


###
    FileSystem: "a target FileSystem to watch":
      supported: 'Linux'
    Location: "path in filesystem"
    EventMap: "a mapping of events to filters or triggers" 
