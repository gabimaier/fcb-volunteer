// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.services;

import java.util.List;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Tag;
import ro.fundatiacomunitarabucuresti.volunteer.services.TagService;

privileged aspect TagService_Roo_Service {
    
    public abstract long TagService.countAllTags();    
    public abstract void TagService.deleteTag(Tag tag);    
    public abstract Tag TagService.findTag(Long id);    
    public abstract List<Tag> TagService.findAllTags();    
    public abstract List<Tag> TagService.findTagEntries(int firstResult, int maxResults);    
    public abstract void TagService.saveTag(Tag tag);    
    public abstract Tag TagService.updateTag(Tag tag);    
}
