package ro.fundatiacomunitarabucuresti.volunteer.services;
import org.springframework.roo.addon.layers.service.RooService;
import ro.fundatiacomunitarabucuresti.volunteer.domain.Skill;

import java.util.List;

@RooService(domainTypes = { ro.fundatiacomunitarabucuresti.volunteer.domain.Skill.class })
public interface SkillService {
    List<Skill> findAllSkills();
}
