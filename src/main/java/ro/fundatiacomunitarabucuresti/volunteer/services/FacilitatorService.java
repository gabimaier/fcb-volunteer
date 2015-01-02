package ro.fundatiacomunitarabucuresti.volunteer.services;
import org.springframework.roo.addon.layers.service.RooService;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Facilitator;

@RooService(domainTypes = { ro.fundatiacomunitarabucuresti.volunteer.domain.Facilitator.class })
public interface FacilitatorService {
    void saveFacilitator(Facilitator facilitator);
}
