module Validators
  class FileValidator
    def initialize(file)
      @file = file
    end

    #Arquivo e validos se
    #  - Tab e usado como separador de campo
    #  - Cotem apenas seis colunas
    def validate
      @file.each_line.first.split(/\t/).count == 6
    end
  end