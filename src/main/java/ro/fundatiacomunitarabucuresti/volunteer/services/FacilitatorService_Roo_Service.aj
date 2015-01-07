// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.services;

import java.util.List;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Facilitator;
import ro.fundatiacomunitarabucuresti.volunteer.services.FacilitatorService;

privileged aspect FacilitatorService_Roo_Service {
    
    public abstract long FacilitatorService.countAllFacilitators();    
    public abstract void FacilitatorService.deleteFacilitator(Facilitator facilitator);    
    public abstract Facilitator FacilitatorService.findFacilitator(Long id);    
    public abstract List<Facilitator> FacilitatorService.findAllFacilitators();    
    public abstract List<Facilitator> FacilitatorService.findFacilitatorEntries(int firstResult, int maxResults);    
    public abstract Facilitator FacilitatorService.updateFacilitator(Facilitator facilitator);    
}
