module DockerizeRails
  module CommandLineMethods
    require 'colorize'

    def self.invoke(options)
      DRNameSpace.add_hash options[1][:args]
      commands = Helpers.processed_commands
      case options[0]
      when *(commands[:configure])
        return configure
      when *(commands[:dockerize])
        return dockerize
      when *(commands[:undockerize])
        return undockerize
      when *(commands[:docker_info])
        return docker_info
      when *(commands[:docker_pull])
        return docker_pull
      when *(commands[:docker_build])
        return docker_build
      when *(commands[:docker_start])
        return docker_start
      when *(commands[:docker_stop])
        return docker_stop
      when *(commands[:docker_delete])
        return docker_delete
      when *(commands[:help])
        return help
      else
        return help 1
      end
    end

    def self.dockerize
      Helpers.ensure_rails_root
      DRNameSpace.load
      ConfigGenerator.dockerize
    end

    def self.undockerize
      Helpers.ensure_rails_root
      ConfigGenerator.undockerize
    end

    def self.configure
      Helpers.ensure_rails_root
      ConfigGenerator.configure
    end

    def self.help(status = 0)
      puts "\nCommand not found".red if status != 0
      puts Helpers.help.white
      status
    end

    def self.docker_info
      DockerCommands.info
      0
    end

    def self.docker_pull
      DRNameSpace.load
      DockerCommands.pull
      0
    end

    def self.docker_build
      DRNameSpace.load
      DockerCommands.build
      0
    end

    def self.docker_start
      DRNameSpace.load
      DockerCommands.start
      0
    end

    def self.docker_stop
      DRNameSpace.load
      DockerCommands.stop
      0
    end

    def self.docker_delete
      DRNameSpace.load
      DockerCommands.delete
      0
    end
  end
end
