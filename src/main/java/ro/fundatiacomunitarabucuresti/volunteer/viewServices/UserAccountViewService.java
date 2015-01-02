package ro.fundatiacomunitarabucuresti.volunteer.viewServices;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Facilitator;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Organization;
import ro.fundatiacomunitarabucuresti.volunteer.domain.UserAccount;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;

public interface UserAccountViewService {
    void populateEditForm(Model uiModel, UserAccount volunteer);
    void createVolunteer(Volunteer volunteer);
    void createOrganization(Organization organization);
    void createFacilitator(Facilitator facilitator);
}
