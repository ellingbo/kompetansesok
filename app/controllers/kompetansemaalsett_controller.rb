class KompetansemaalsettController < ApplicationController

  def show
    @kompetansemaalsett = Kompetansemaalsett.find_by_uuid(params[:id])
    @brodsmule_elementer = []
    legg_laereplan_i_brodsmulesti()
    legg_fag_i_brodsmulesti()

    if params[:hovedomraade_id]
      @hovedomraade = Hovedomraade.find_by_uuid(params[:hovedomraade_id])
      kompetansemaal = @kompetansemaalsett.kompetansemaal_for_hovedomraade(@hovedomraade)
      @brodsmule_elementer << @hovedomraade
      @through_hovedomraade = true
    else
      kompetansemaal = @kompetansemaalsett.kompetansemaal
    end
    @through_laereplan = true if params[:laereplan_id]
    @brodsmule_elementer << @kompetansemaalsett
    @brodsmulesti = lag_brodsmuler(@brodsmule_elementer)
    @kompetansemaal_treff = lag_kompetansemaalrader(kompetansemaal, @brodsmule_elementer)
  end

  private
  def legg_laereplan_i_brodsmulesti
    if params[:laereplan_id]
      laereplan = Laereplan.find_by_uuid(params[:laereplan_id])
      @brodsmule_elementer << laereplan
    end
  end

  def legg_fag_i_brodsmulesti
    if params[:fag_id]
      fag = Fag.find_by_uuid(params[:fag_id])
      @brodsmule_elementer << fag
    end
  end

  

end