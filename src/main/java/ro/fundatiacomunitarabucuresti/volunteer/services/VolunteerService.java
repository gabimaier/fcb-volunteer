package ro.fundatiacomunitarabucuresti.volunteer.services;
import org.springframework.roo.addon.layers.service.RooService;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;

@RooService(domainTypes = { ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer.class })
public interface VolunteerService {
    void saveVolunteer(Volunteer volunteer);
}
