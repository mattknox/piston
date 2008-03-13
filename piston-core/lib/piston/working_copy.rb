module Piston
  class WorkingCopy
    class << self
      def logger=(logger)
        @@logger = logger
      end

      def logger
        @@logger
      end

      def guess(path)
        logger.debug {"Guessing the working copy type of #{path.inspect}"}
        self.new(path)
      end
    end

    attr_reader :path

    def initialize(path)
      @path = path.kind_of?(Pathname) ? path : Pathname.new(path)
      logger.debug {"Initialized on #{@path}"}
    end

    def logger
      self.class.logger
    end

    def to_s
      "Piston::WorkingCopy(#{@path})"
    end

    def exist?
    end

    # Creates the initial working copy for pistonizing a new repository.
    def create
      logger.debug {"Creating working copy at #{path}"}
    end

    # Copy files from +revision+.  +revision+ must
    # #respond_to?(:each), and return each file that is to be copied.
    # Only files must be returned.
    #
    # Each item yielded by Revision#each must be a relative path.
    #
    # WorkingCopy will call Revision#copy_to with the full path to where the
    # file needs to be copied.
    def copy_from(revision)
      logger.debug {"Copying from #{revision} to #{path}"}
    end

    # Stores a Hash of values that can be retrieved later.
    def remember(values)
      logger.debug {"Remembering #{values.inspect}"}
    end

    def finalize
      logger.debug {"Finalizing #{path}"}
    end
  end
end

