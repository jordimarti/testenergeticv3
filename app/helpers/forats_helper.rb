module ForatsHelper
	def transmitancia_linial_acoplament(tipus_marc, tipus_vidre)
    if tipus_marc == 'fusta' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'fusta' && tipus_vidre == 'doble'
      return 0.06
    elsif tipus_marc == 'fusta' && tipus_vidre == 'doble baix emissiu'
      return 0.08
    elsif tipus_marc == 'fusta' && tipus_vidre == 'triple'
      return 0.05
    elsif tipus_marc == 'fusta' && tipus_vidre == 'triple baix emissiu'
      return 0.06
    elsif tipus_marc == 'pvc' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'pvc' && tipus_vidre == 'doble'
      return 0.06
    elsif tipus_marc == 'pvc' && tipus_vidre == 'doble baix emissiu'
      return 0.08
    elsif tipus_marc == 'pvc' && tipus_vidre == 'triple'
      return 0.05
    elsif tipus_marc == 'pvc' && tipus_vidre == 'triple baix emissiu'
      return 0.06
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'doble'
      return 0.08
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'doble baix emissiu'
      return 0.11
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'triple'
      return 0.06
    elsif tipus_marc == 'metalic rpt' && tipus_vidre == 'triple baix emissiu'
      return 0.08
    elsif tipus_marc == 'metalic' && tipus_vidre == 'senzill'
      return 0
    elsif tipus_marc == 'metalic' && tipus_vidre == 'doble'
      return 0.02
    elsif tipus_marc == 'metalic' && tipus_vidre == 'doble baix emissiu'
      return 0.05
    elsif tipus_marc == 'metalic' && tipus_vidre == 'triple'
      return 0.01
    elsif tipus_marc == 'metalic' && tipus_vidre == 'triple baix emissiu'
      return 0.04
    end
  end
end
