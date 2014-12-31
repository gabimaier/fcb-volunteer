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
import ro.fundatiacomunitarabucuresti.volunteer.domain.Organization;
import ro.fundatiacomunitarabucuresti.volunteer.domain.OrganizationDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.services.OrganizationService;

privileged aspect OrganizationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: OrganizationDataOnDemand: @Component;
    
    private Random OrganizationDataOnDemand.rnd = new SecureRandom();
    
    private List<Organization> OrganizationDataOnDemand.data;
    
    @Autowired
    CityDataOnDemand OrganizationDataOnDemand.cityDataOnDemand;
    
    @Autowired
    OrganizationService OrganizationDataOnDemand.organizationService;
    
    public Organization OrganizationDataOnDemand.getNewTransientOrganization(int index) {
        Organization obj = new Organization();
        setCity(obj, index);
        setEmail(obj, index);
        setEnabled(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setName(obj, index);
        setPassword(obj, index);
        setPhone(obj, index);
        setUserName(obj, index);
        setWebsite(obj, index);
        return obj;
    }
    
    public void OrganizationDataOnDemand.setCity(Organization obj, int index) {
        City city = cityDataOnDemand.getRandomCity();
        obj.setCity(city);
    }
    
    public void OrganizationDataOnDemand.setEmail(Organization obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void OrganizationDataOnDemand.setEnabled(Organization obj, int index) {
        Boolean enabled = Boolean.TRUE;
        obj.setEnabled(enabled);
    }
    
    public void OrganizationDataOnDemand.setFirstName(Organization obj, int index) {
        String firstName = "firstName_" + index;
        obj.setFirstName(firstName);
    }
    
    public void OrganizationDataOnDemand.setLastName(Organization obj, int index) {
        String lastName = "lastName_" + index;
        obj.setLastName(lastName);
    }
    
    public void OrganizationDataOnDemand.setName(Organization obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void OrganizationDataOnDemand.setPassword(Organization obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void OrganizationDataOnDemand.setPhone(Organization obj, int index) {
        String phone = "phone_" + index;
        obj.setPhone(phone);
    }
    
    public void OrganizationDataOnDemand.setUserName(Organization obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public void OrganizationDataOnDemand.setWebsite(Organization obj, int index) {
        String website = "website_" + index;
        obj.setWebsite(website);
    }
    
    public Organization OrganizationDataOnDemand.getSpecificOrganization(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Organization obj = data.get(index);
        Long id = obj.getId();
        return organizationService.findOrganization(id);
    }
    
    public Organization OrganizationDataOnDemand.getRandomOrganization() {
        init();
        Organization obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return organizationService.findOrganization(id);
    }
    
    public boolean OrganizationDataOnDemand.modifyOrganization(Organization obj) {
        return false;
    }
    
    public void OrganizationDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = organizationService.findOrganizationEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Organization' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Organization>();
        for (int i = 0; i < 10; i++) {
            Organization obj = getNewTransientOrganization(i);
            try {
                organizationService.saveOrganization(obj);
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