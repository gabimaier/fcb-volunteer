// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.fundatiacomunitarabucuresti.volunteer.services;

import java.util.List;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Skill;
import ro.fundatiacomunitarabucuresti.volunteer.services.SkillService;

privileged aspect SkillService_Roo_Service {
    
    public abstract long SkillService.countAllSkills();    
    public abstract void SkillService.deleteSkill(Skill skill);    
    public abstract Skill SkillService.findSkill(Long id);    
    public abstract List<Skill> SkillService.findSkillEntries(int firstResult, int maxResults);    
    public abstract void SkillService.saveSkill(Skill skill);    
    public abstract Skill SkillService.updateSkill(Skill skill);    
}
