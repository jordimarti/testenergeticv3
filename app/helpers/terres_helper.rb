module TerresHelper
	#Calculem transmitància tèrmica segons Taula 3 DB-HE1 calculo parametros caracteristicos
	def transmitancia_terra(terra)
		b = terra.superficie / (terra.longitud_perimetre * 0.5)
    case b
    when 0..10.49
      b = b.round
    when 10.5..12.99
      b = 12
    when 13..14.99
      b = 14
    when 15..16.99
      b = 16
    when 17..18.99
      b = 18
    else
      b = 20
    end
    
    case terra.resistencia_termica_aillant
    when 0..0.75
      r = 0.5
    when 0.76..1.25
      r = 1
    when 1.26..1.75
      r = 1.5
    when 1.76..2.25
      r = 2
    else
      r = 2.5
    end

    case terra.ample_aillament
    when 0..0.75
      d = 0.5
    when 0.76..1.25
      d = 1
    else
      d = 1.5
    end

    transmitancia = TransmitanciaLlosa.where(longitud_perimetre: b, resistencia_termica_aillant: r, ample_aillament: d).last
		return transmitancia.valor
	end

end
