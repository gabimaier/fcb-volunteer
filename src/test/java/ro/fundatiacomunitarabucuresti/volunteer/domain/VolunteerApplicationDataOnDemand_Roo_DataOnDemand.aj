// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.domain.ProjectDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplicationDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.services.VolunteerApplicationService;

privileged aspect VolunteerApplicationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VolunteerApplicationDataOnDemand: @Component;
    
    private Random VolunteerApplicationDataOnDemand.rnd = new SecureRandom();
    
    private List<VolunteerApplication> VolunteerApplicationDataOnDemand.data;
    
    @Autowired
    ProjectDataOnDemand VolunteerApplicationDataOnDemand.projectDataOnDemand;
    
    @Autowired
    VolunteerDataOnDemand VolunteerApplicationDataOnDemand.volunteerDataOnDemand;
    
    @Autowired
    VolunteerApplicationService VolunteerApplicationDataOnDemand.volunteerApplicationService;
    
    public VolunteerApplication VolunteerApplicationDataOnDemand.getNewTransientVolunteerApplication(int index) {
        VolunteerApplication obj = new VolunteerApplication();
        setAccepted(obj, index);
        setProject(obj, index);
        setVolunteer(obj, index);
        return obj;
    }
    
    public void VolunteerApplicationDataOnDemand.setAccepted(VolunteerApplication obj, int index) {
        Boolean accepted = Boolean.TRUE;
        obj.setAccepted(accepted);
    }
    
    public void VolunteerApplicationDataOnDemand.setProject(VolunteerApplication obj, int index) {
        Project project = projectDataOnDemand.getRandomProject();
        obj.setProject(project);
    }
    
    public void VolunteerApplicationDataOnDemand.setVolunteer(VolunteerApplication obj, int index) {
        Volunteer volunteer = volunteerDataOnDemand.getRandomVolunteer();
        obj.setVolunteer(volunteer);
    }
    
    public VolunteerApplication VolunteerApplicationDataOnDemand.getSpecificVolunteerApplication(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        VolunteerApplication obj = data.get(index);
        Long id = obj.getId();
        return volunteerApplicationService.findVolunteerApplication(id);
    }
    
    public VolunteerApplication VolunteerApplicationDataOnDemand.getRandomVolunteerApplication() {
        init();
        VolunteerApplication obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return volunteerApplicationService.findVolunteerApplication(id);
    }
    
    public boolean VolunteerApplicationDataOnDemand.modifyVolunteerApplication(VolunteerApplication obj) {
        return false;
    }
    
    public void VolunteerApplicationDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = volunteerApplicationService.findVolunteerApplicationEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'VolunteerApplication' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<VolunteerApplication>();
        for (int i = 0; i < 10; i++) {
            VolunteerApplication obj = getNewTransientVolunteerApplication(i);
            try {
                volunteerApplicationService.saveVolunteerApplication(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
