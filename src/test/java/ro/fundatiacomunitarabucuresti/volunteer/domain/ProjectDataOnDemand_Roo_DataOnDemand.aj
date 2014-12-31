// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Date;
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
import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.domain.ProjectDataOnDemand;
import ro.fundatiacomunitarabucuresti.volunteer.services.ProjectService;

privileged aspect ProjectDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProjectDataOnDemand: @Component;
    
    private Random ProjectDataOnDemand.rnd = new SecureRandom();
    
    private List<Project> ProjectDataOnDemand.data;
    
    @Autowired
    CityDataOnDemand ProjectDataOnDemand.cityDataOnDemand;
    
    @Autowired
    OrganizationDataOnDemand ProjectDataOnDemand.organizationDataOnDemand;
    
    @Autowired
    ProjectService ProjectDataOnDemand.projectService;
    
    public Project ProjectDataOnDemand.getNewTransientProject(int index) {
        Project obj = new Project();
        setAccepted(obj, index);
        setCity(obj, index);
        setDescription(obj, index);
        setInitialFeedback(obj, index);
        setOrganization(obj, index);
        setProgress(obj, index);
        setResults(obj, index);
        setStartDate(obj, index);
        setTitle(obj, index);
        return obj;
    }
    
    public void ProjectDataOnDemand.setAccepted(Project obj, int index) {
        Boolean accepted = Boolean.TRUE;
        obj.setAccepted(accepted);
    }
    
    public void ProjectDataOnDemand.setCity(Project obj, int index) {
        City city = cityDataOnDemand.getRandomCity();
        obj.setCity(city);
    }
    
    public void ProjectDataOnDemand.setDescription(Project obj, int index) {
        String description = "description_" + index;
        obj.setDescription(description);
    }
    
    public void ProjectDataOnDemand.setInitialFeedback(Project obj, int index) {
        String initialFeedback = "initialFeedback_" + index;
        obj.setInitialFeedback(initialFeedback);
    }
    
    public void ProjectDataOnDemand.setOrganization(Project obj, int index) {
        Organization organization = organizationDataOnDemand.getRandomOrganization();
        obj.setOrganization(organization);
    }
    
    public void ProjectDataOnDemand.setProgress(Project obj, int index) {
        String progress = "progress_" + index;
        obj.setProgress(progress);
    }
    
    public void ProjectDataOnDemand.setResults(Project obj, int index) {
        String results = "results_" + index;
        obj.setResults(results);
    }
    
    public void ProjectDataOnDemand.setStartDate(Project obj, int index) {
        Date startDate = new Date(new Date().getTime() + 10000000L);
        obj.setStartDate(startDate);
    }
    
    public void ProjectDataOnDemand.setTitle(Project obj, int index) {
        String title = "title_" + index;
        if (title.length() > 250) {
            title = new Random().nextInt(10) + title.substring(1, 250);
        }
        obj.setTitle(title);
    }
    
    public Project ProjectDataOnDemand.getSpecificProject(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Project obj = data.get(index);
        Long id = obj.getId();
        return projectService.findProject(id);
    }
    
    public Project ProjectDataOnDemand.getRandomProject() {
        init();
        Project obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return projectService.findProject(id);
    }
    
    public boolean ProjectDataOnDemand.modifyProject(Project obj) {
        return false;
    }
    
    public void ProjectDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = projectService.findProjectEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Project' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Project>();
        for (int i = 0; i < 10; i++) {
            Project obj = getNewTransientProject(i);
            try {
                projectService.saveProject(obj);
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
