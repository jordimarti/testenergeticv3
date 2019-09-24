module ComponentCobertesHelper

	def resistencia_termica_component(id)
		component = ComponentCoberta.find(id.to_i)
		#Si s'han omplert els paràmetres gruix i conductivitat calculem la resistència tèrmica del component
		if component.gruix != nil && component.conductivitat != nil
      component.resistencia_termica = component.gruix/component.conductivitat
      component.save
      falten_dades = false
    elsif component.resistencia_termica != nil
    	falten_dades = false
    else
    	falten_dades = true
    end
    return falten_dades
	end

	def transmitancia_coberta(coberta_id, falten_dades)
		resistencia_total = 0.0
    components = ComponentCoberta.where(coberta_id: coberta_id)
    components.each do |component|
      resistencia_total += component.resistencia_termica
    end
    resistencia = 0.04 + resistencia_total + 0.1
    transmitancia = 1/resistencia
    return transmitancia
	end

	def transmitancia_limit_cobertes_cte(zona_climatica)
		zona_climatica_hivern = zona_climatica.chars.first
		case zona_climatica_hivern
		when 'b'
			valor_limit = 0.65
		when 'c'
			valor_limit = 0.5
		when 'd'
			valor_limit = 0.4
		when 'e'
			valor_limit = 0.35
		end
		return valor_limit
	end

end
