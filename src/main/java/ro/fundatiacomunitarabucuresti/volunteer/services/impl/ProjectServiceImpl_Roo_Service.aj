// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.services.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.services.impl.ProjectServiceImpl;

privileged aspect ProjectServiceImpl_Roo_Service {
    
    declare @type: ProjectServiceImpl: @Service;
    
    declare @type: ProjectServiceImpl: @Transactional;
    
    public long ProjectServiceImpl.countAllProjects() {
        return Project.countProjects();
    }
    
    public void ProjectServiceImpl.deleteProject(Project project) {
        project.remove();
    }
    
    public Project ProjectServiceImpl.findProject(Long id) {
        return Project.findProject(id);
    }
    
    public List<Project> ProjectServiceImpl.findAllProjects() {
        return Project.findAllProjects();
    }
    
    public List<Project> ProjectServiceImpl.findProjectEntries(int firstResult, int maxResults) {
        return Project.findProjectEntries(firstResult, maxResults);
    }
    
    public void ProjectServiceImpl.saveProject(Project project) {
        project.persist();
    }
    
    public Project ProjectServiceImpl.updateProject(Project project) {
        return project.merge();
    }
    
}
