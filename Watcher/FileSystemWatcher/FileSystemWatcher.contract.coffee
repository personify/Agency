agent: FileSystemWatcher: 

  isA: 'Watcher'

  goal: "Determine type of FileSystem (unless provided) and watch it"
 
  models:
    FileSystem: supported: 'linux'

  services:  
    watch: 
      in: 
        target: @optional @FileSystem
        location: @path
        recursive: @bool
        eventMap: @object

      sideFX: ->
        if target? then Watcher(target).watch @in #!
        else Watcher(getFileSystem()).watch @in #!
  
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
