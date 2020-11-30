class ListaController < ApplicationController


def index
    @arquivo = Arquivo.all
end


end