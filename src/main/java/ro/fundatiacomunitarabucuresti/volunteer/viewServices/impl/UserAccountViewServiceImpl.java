package ro.fundatiacomunitarabucuresti.volunteer.viewServices.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import ro.fundatiacomunitarabucuresti.volunteer.domain.*;
import ro.fundatiacomunitarabucuresti.volunteer.domain.dictionaries.Roles;
import ro.fundatiacomunitarabucuresti.volunteer.services.*;
import ro.fundatiacomunitarabucuresti.volunteer.viewServices.UserAccountViewService;

@Service
@Transactional
public class UserAccountViewServiceImpl implements UserAccountViewService {
    @Autowired
    private CityService cityService;
    @Autowired
    private SkillService skillService;
    @Autowired
    private VolunteerService volunteerService;
    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private FacilitatorService facilitatorService;
    @Autowired
    private UserRoleService userRoleService;

    @Override
    public void populateEditForm(Model uiModel, UserAccount userAccount) {
        if(userAccount instanceof Volunteer) {
            uiModel.addAttribute("volunteer", userAccount);
            uiModel.addAttribute("citys", cityService.findAllCitys());
            uiModel.addAttribute("skills", skillService.findAllSkills());
        }
        else if(userAccount instanceof Organization){
            uiModel.addAttribute("volunteer", userAccount);
        }
    }

    @Override
    @Transactional
    public void createVolunteer(Volunteer volunteer) {
        volunteer.setEnabled(Boolean.TRUE);
        volunteerService.saveVolunteer(volunteer);
        UserRole volunteerRole = new UserRole(volunteer, Roles.VOLUNTEER);
        userRoleService.saveUserRole(volunteerRole);
    }

    @Override
    @Transactional
    public void createOrganization(Organization organization) {
        organization.setEnabled(Boolean.TRUE);
        organizationService.saveOrganization(organization);
        UserRole organizationRole = new UserRole(organization, Roles.ORGANIZATION);
        userRoleService.saveUserRole(organizationRole);
    }

    @Override
    @Transactional
    public void createFacilitator(Facilitator facilitator) {
        facilitator.setEnabled(Boolean.TRUE);
        facilitatorService.saveFacilitator(facilitator);
        UserRole organizationRole = new UserRole(facilitator, Roles.FACILITATOR);
        userRoleService.saveUserRole(organizationRole);
    }
}
