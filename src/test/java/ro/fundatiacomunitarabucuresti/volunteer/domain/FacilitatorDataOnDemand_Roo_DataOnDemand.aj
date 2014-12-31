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
import ro.fundatiacomunitarabucuresti.volunteer.domain.Facilitator;
import ro.fundatiacomunitarabucuresti.volunteer.domain.FacilitatorDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.services.FacilitatorService;

privileged aspect FacilitatorDataOnDemand_Roo_DataOnDemand {
    
    declare @type: FacilitatorDataOnDemand: @Component;
    
    private Random FacilitatorDataOnDemand.rnd = new SecureRandom();
    
    private List<Facilitator> FacilitatorDataOnDemand.data;
    
    @Autowired
    CityDataOnDemand FacilitatorDataOnDemand.cityDataOnDemand;
    
    @Autowired
    FacilitatorService FacilitatorDataOnDemand.facilitatorService;
    
    public Facilitator FacilitatorDataOnDemand.getNewTransientFacilitator(int index) {
        Facilitator obj = new Facilitator();
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
    
    public void FacilitatorDataOnDemand.setCity(Facilitator obj, int index) {
        City city = cityDataOnDemand.getRandomCity();
        obj.setCity(city);
    }
    
    public void FacilitatorDataOnDemand.setEmail(Facilitator obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void FacilitatorDataOnDemand.setEnabled(Facilitator obj, int index) {
        Boolean enabled = Boolean.TRUE;
        obj.setEnabled(enabled);
    }
    
    public void FacilitatorDataOnDemand.setFirstName(Facilitator obj, int index) {
        String firstName = "firstName_" + index;
        obj.setFirstName(firstName);
    }
    
    public void FacilitatorDataOnDemand.setLastName(Facilitator obj, int index) {
        String lastName = "lastName_" + index;
        obj.setLastName(lastName);
    }
    
    public void FacilitatorDataOnDemand.setPassword(Facilitator obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void FacilitatorDataOnDemand.setPhone(Facilitator obj, int index) {
        String phone = "phone_" + index;
        obj.setPhone(phone);
    }
    
    public void FacilitatorDataOnDemand.setUserName(Facilitator obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public Facilitator FacilitatorDataOnDemand.getSpecificFacilitator(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Facilitator obj = data.get(index);
        Long id = obj.getId();
        return facilitatorService.findFacilitator(id);
    }
    
    public Facilitator FacilitatorDataOnDemand.getRandomFacilitator() {
        init();
        Facilitator obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return facilitatorService.findFacilitator(id);
    }
    
    public boolean FacilitatorDataOnDemand.modifyFacilitator(Facilitator obj) {
        return false;
    }
    
    public void FacilitatorDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = facilitatorService.findFacilitatorEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Facilitator' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Facilitator>();
        for (int i = 0; i < 10; i++) {
            Facilitator obj = getNewTransientFacilitator(i);
            try {
                facilitatorService.saveFacilitator(obj);
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
