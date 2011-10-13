module ArribosHelper
  
  # Determina si un BAX ya fue reportado. 
  # Si es false, muestra el boton para reportarlo. 
  # Caso contrario, muestra el boton deshabilitado.
  def reportado(existe, bax_id)    
    if existe
      submit_tag 'Arribo reportado', :title => 'Arribo reportado', :type => 'button', :disabled => 'disabled', :class => 'pequenio'
    else      
      submit_tag 'Reportar arribo', :title => 'Reportar arribo', :type => 'button', :name => nil, :id => nil, :class => 'blue reportar_arribo_bax pequenio', 'data-bax' => bax_id
    end
  end

  def id(bax_id, gabarra_id = nil)
    if gabarra_id.nil?
      'bax_' + bax_id.split('/')[0] + '_' + bax_id.split('/')[1]
    else
      'gabarra_' + bax_id.split('/')[0] + '_' + bax_id.split('/')[1] + '_' + gabarra_id.split('-')[0]  + '_' + gabarra_id.split('-')[1]
    end
  end

  def habilitada(img)
    if cannot? :manage, DescargaBauxita
      'class="deshabilitada"'
    elsif img == 'flag_finish.png' || img == 'steering_wheel.png'
      'class="deshabilitada"'
    else
      nil
    end 
  end

  def campo_habilitado(field)
    if field.nil?
      false
    else
      true
    end
  end

  def tiempo_permitido(field)
    (field - (field % 1)).to_i.to_s + ':' + ((field % 1) * 60).to_i.to_s
  end

  def status_submit(atraque, inicio, fin, buque = false)
    boton = Hash.new

    if !fin.nil?
      status = 'desatraque'
    else
      if !inicio.nil?
        status = 'fin_descarga'
      else
        if !atraque.nil?
          status = 'inicio_descarga'
        else
          status = 'atraque'
        end
      end
    end
    if buque
      submit_tag 'Enviar', :name => 'submit_campo', :id => nil, :class => 'green', 'data-buque' => @buque.id, 'data-status' => status
    else
      submit_tag 'Enviar', :name => 'submit_campo', :id => nil, :class => 'green', 'data-bax' => @gabarra.bax_id, 'data-gabarra' => @gabarra.gabarra_id, 'data-status' => status
    end
  end
end