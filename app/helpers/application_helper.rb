module ApplicationHelper
	def zona_climatica_cte(entitat_id)
		dades_edifici = Entitat.where(id: entitat_id).last
		if dades_edifici.provincia == 'Barcelona'
			if dades_edifici.altitud_municipi < 250
				zona_climatica = 'c2'
			elsif dades_edifici.altitud_municipi >249 && dades_edifici.altitud_municipi < 450
				zona_climatica = 'd2'
			elsif dades_edifici.altitud_municipi > 449 && dades_edifici.altitud_municipi < 750
				zona_climatica = 'd1'
			elsif dades_edifici.altitud_municipi > 749
				zona_climatica = 'e1'
			end
		elsif dades_edifici.provincia == 'Girona'
			if dades_edifici.altitud_municipi < 100
				zona_climatica = 'c2'
			elsif dades_edifici.altitud_municipi >99 && dades_edifici.altitud_municipi < 600
				zona_climatica = 'd2'
			elsif dades_edifici.altitud_municipi > 599
				zona_climatica = 'e1'
			end
		elsif dades_edifici.provincia == 'Lleida'
			if dades_edifici.altitud_municipi < 100
				zona_climatica = 'c3'
			elsif dades_edifici.altitud_municipi >99 && dades_edifici.altitud_municipi < 600
				zona_climatica = 'd3'
			elsif dades_edifici.altitud_municipi > 599
				zona_climatica = 'e1'
			end
		elsif dades_edifici.provincia == 'Tarragona'
			if dades_edifici.altitud_municipi < 50
				zona_climatica = 'b3'
			elsif dades_edifici.altitud_municipi >49 && dades_edifici.altitud_municipi < 500
				zona_climatica = 'c3'
			elsif dades_edifici.altitud_municipi > 499
				zona_climatica = 'd3'
			end
		end
		return zona_climatica
	end
end
