module Parslet::Bytecode
  class VM
    include Parslet::Atoms::CanFlatten
    
    def initialize(debug=false)
      @debug = debug
    end
    
    def debug?
      @debug
    end
    
    def run(program, io)
      init(program, io)
      
      loop do
        p(
          :ip => Compiler::Address.new(@ip), 
          :top => @values.last,
          :e => @error.to_s
        ) if debug?
        
        instruction = fetch
        break unless instruction
        
        p [:instr, instruction] if debug?
        p [:stack, @values.reverse[0,4], @values.size>4 ? '...' : ''] if debug?
        p [:calls, @calls] if debug?

        instruction.run(self)
        break if @stop
        
        puts if debug?
      end
      
      return flatten(@values.last) if success? && source.eof?

      if success?
        # assert: not source.eof?
        current_pos = source.pos
        source.error(
          "Don't know what to do with #{source.read(100)}", current_pos).
          raise(Parslet::UnconsumedInput)
      end

      @error.raise
    end
    
    attr_reader :source
    attr_reader :context
    
    def init(program, io)
      @ip = 0
      @program = program
      @source = Parslet::Source.new(io)
      @context = Parslet::Atoms::Context.new
      @values = []
      @calls  = []
    end
    
    def fetch
      @program.at(@ip).tap { @ip += 1 }
    end
    
    # --------------------------------------------- interface for instructions
    def push(value)
      @values.push value
    end
    def pop(n=nil)
      if n
        @values.pop(n)
      else
        @values.pop
      end
    end
    def jump(address)
      @ip = address.address
    end
    def success?
      !@error
    end
    def call(adr)
      @calls.push @ip
      jump(adr)
    end
    def call_ret
      @ip = @calls.pop
      fail "One pop too many - empty call stack in #call_ret." unless @ip
    end
    def set_error(error)
      @error = error
    end
    def clear_error
      @error = nil
    end
    attr_reader :error
    def stop
      @stop = true
    end
  end
end