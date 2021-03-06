// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.services.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.services.impl.VolunteerServiceImpl;

privileged aspect VolunteerServiceImpl_Roo_Service {
    
    declare @type: VolunteerServiceImpl: @Service;
    
    declare @type: VolunteerServiceImpl: @Transactional;
    
    public long VolunteerServiceImpl.countAllVolunteers() {
        return Volunteer.countVolunteers();
    }
    
    public void VolunteerServiceImpl.deleteVolunteer(Volunteer volunteer) {
        volunteer.remove();
    }
    
    public Volunteer VolunteerServiceImpl.findVolunteer(Long id) {
        return Volunteer.findVolunteer(id);
    }
    
    public List<Volunteer> VolunteerServiceImpl.findAllVolunteers() {
        return Volunteer.findAllVolunteers();
    }
    
    public List<Volunteer> VolunteerServiceImpl.findVolunteerEntries(int firstResult, int maxResults) {
        return Volunteer.findVolunteerEntries(firstResult, maxResults);
    }
    
    public void VolunteerServiceImpl.saveVolunteer(Volunteer volunteer) {
        volunteer.persist();
    }
    
    public Volunteer VolunteerServiceImpl.updateVolunteer(Volunteer volunteer) {
        return volunteer.merge();
    }
    
}
