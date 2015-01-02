package ro.fundatiacomunitarabucuresti.volunteer.services;
import org.springframework.roo.addon.layers.service.RooService;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Organization;

@RooService(domainTypes = { ro.fundatiacomunitarabucuresti.volunteer.domain.Organization.class })
public interface OrganizationService {
    void saveOrganization(Organization organization);
}
