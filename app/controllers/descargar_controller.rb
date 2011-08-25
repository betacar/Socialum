class DescargarController < ApplicationController
  before_filter :authenticate_user! # Autentica cada usuario contra LDAP antes de ejecutar cualquier controller
  load_and_authorize_resource  :class => "DescargaBauxita"

  # POST /descargar/gabarra/001/2006/ABC-123/
  # POST /descargar/gabarra/001/2006/ABC-123.html
  def gabarra
    respond_to do |format|
      begin
        @gabarra = DescargaBauxita.gabarra(params)
        format.json { render :json => @gabarra }
      rescue Exceptions::PresenciaValoresExcepcion => errores
        format.json { render :json => errores.errors, :status => 400 }
      end
    end
  end

  # GET /descargar/buque/1
  # GET /descargar/buque/1.html
  def buque
    respond_to do |format|
      begin
        @gabarra = DescargaBauxita.gabarra(params)
        format.json { render :json => @gabarra }
      rescue Exceptions::PresenciaValoresExcepcion => errores
        format.json { render :json => errores.errors, :status => 400 }
      end
    end
  end

  # POST /descargar/evento/1
  def evento
    respond_to do |format|
      begin
        @novedad = DescargaBauxita.novedad(params)
        format.json { render :json => @novedad }
      rescue Exceptions::PresenciaValoresExcepcion => errores
        format.json { render :json => errores.errors, :status => 400 }
      end
    end
  end
end

