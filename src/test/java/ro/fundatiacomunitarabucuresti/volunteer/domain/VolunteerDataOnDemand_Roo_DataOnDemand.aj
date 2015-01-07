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
import ro.fundatiacomunitarabucuresti.volunteer.domain.City;
import ro.fundatiacomunitarabucuresti.volunteer.domain.CityDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.services.VolunteerService;

privileged aspect VolunteerDataOnDemand_Roo_DataOnDemand {
    
    declare @type: VolunteerDataOnDemand: @Component;
    
    private Random VolunteerDataOnDemand.rnd = new SecureRandom();
    
    private List<Volunteer> VolunteerDataOnDemand.data;
    
    @Autowired
    CityDataOnDemand VolunteerDataOnDemand.cityDataOnDemand;
    
    @Autowired
    VolunteerService VolunteerDataOnDemand.volunteerService;
    
    public Volunteer VolunteerDataOnDemand.getNewTransientVolunteer(int index) {
        Volunteer obj = new Volunteer();
        setCity(obj, index);
        setEmail(obj, index);
        setEnabled(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setPassword(obj, index);
        setPhone(obj, index);
        setUserName(obj, index);
        return obj;
    }
    
    public void VolunteerDataOnDemand.setCity(Volunteer obj, int index) {
        City city = cityDataOnDemand.getRandomCity();
        obj.setCity(city);
    }
    
    public void VolunteerDataOnDemand.setEmail(Volunteer obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void VolunteerDataOnDemand.setEnabled(Volunteer obj, int index) {
        Boolean enabled = Boolean.FALSE;
        obj.setEnabled(enabled);
    }
    
    public void VolunteerDataOnDemand.setFirstName(Volunteer obj, int index) {
        String firstName = "firstName_" + index;
        obj.setFirstName(firstName);
    }
    
    public void VolunteerDataOnDemand.setLastName(Volunteer obj, int index) {
        String lastName = "lastName_" + index;
        obj.setLastName(lastName);
    }
    
    public void VolunteerDataOnDemand.setPassword(Volunteer obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void VolunteerDataOnDemand.setPhone(Volunteer obj, int index) {
        String phone = "phone_" + index;
        obj.setPhone(phone);
    }
    
    public void VolunteerDataOnDemand.setUserName(Volunteer obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public Volunteer VolunteerDataOnDemand.getSpecificVolunteer(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Volunteer obj = data.get(index);
        Long id = obj.getId();
        return volunteerService.findVolunteer(id);
    }
    
    public Volunteer VolunteerDataOnDemand.getRandomVolunteer() {
        init();
        Volunteer obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return volunteerService.findVolunteer(id);
    }
    
    public boolean VolunteerDataOnDemand.modifyVolunteer(Volunteer obj) {
        return false;
    }
    
    public void VolunteerDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = volunteerService.findVolunteerEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Volunteer' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Volunteer>();
        for (int i = 0; i < 10; i++) {
            Volunteer obj = getNewTransientVolunteer(i);
            try {
                volunteerService.saveVolunteer(obj);
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
