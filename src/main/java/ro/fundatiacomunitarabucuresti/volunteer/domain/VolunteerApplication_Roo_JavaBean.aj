// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.domain;

import ro.fundatiacomunitarabucuresti.volunteer.domain.Project;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Volunteer;
import ro.fundatiacomunitarabucuresti.volunteer.domain.VolunteerApplication;

privileged aspect VolunteerApplication_Roo_JavaBean {
    
    public Boolean VolunteerApplication.getAccepted() {
        return this.accepted;
    }
    
    public void VolunteerApplication.setAccepted(Boolean accepted) {
        this.accepted = accepted;
    }
    
    public Volunteer VolunteerApplication.getVolunteer() {
        return this.volunteer;
    }
    
    public void VolunteerApplication.setVolunteer(Volunteer volunteer) {
        this.volunteer = volunteer;
    }
    
    public Project VolunteerApplication.getProject() {
        return this.project;
    }
    
    public void VolunteerApplication.setProject(Project project) {
        this.project = project;
    }
    
}
